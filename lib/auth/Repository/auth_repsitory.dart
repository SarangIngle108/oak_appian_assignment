import 'package:blackcoffer_assignment/auth/screens/otp_screen.dart';
import 'package:blackcoffer_assignment/auth/screens/user_info.dart';
import 'package:blackcoffer_assignment/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home_screen.dart';
import '../../models/user_model.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  void signInWithPhone(BuildContext context, String phonenumber) async {
    try {
      print("repo sign in");
      await auth.verifyPhoneNumber(
        phoneNumber: phonenumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          print("repo still sign in");
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          print("Navigating to otp screen");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OTPScreen(
                        verificationId: verificationId,
                        phoneNumber: phonenumber,
                      )));
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId, required String userOTP,
  })
  async{
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: userOTP);
      await auth.signInWithCredential(credential);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInformationScreen()));
    }
    on FirebaseAuthException catch(e){
      showSnackBar(context: context, content: e.message!);
    }
  }

  void saveUserDataToFirebase({
    required String name,
   // required File? profilepic,
    required ProviderRef ref,
    required BuildContext context,
  })async{
    try{
      String uid = auth.currentUser!.uid;
   /*   String photourl = 'http://www.goodmorningimagesdownload.com/wp-content/uploads/2021/12/Best-Quality-Profile-Images-Pic-Download-2023.jpg';
      if(profilepic != null){
        photourl = await ref.read(
            CommonFirebaseStorageRepositoryProvider)
            .storeFileToFirebase('profilePic/$uid', profilepic);
      }*/
      var user = UserModel(
        name: name,
        uid: uid,
        phoneNumber: auth.currentUser!.phoneNumber.toString(),
      );
      firestore.collection('users').doc(uid).set(user.toMap());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInformationScreen()));
    }
    catch(e){
      showSnackBar(context: context, content:e.toString());
    }
  }
}
