import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:io';


import '../../home_screen.dart';
import '../controller/auth_controller.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String routeName = '/user-information';
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }



  void storeUserData()async{
    String name = usernameController.text.trim();
    if(name.isNotEmpty){
      ref.read(authControllerProvider).saveDataToFirebase(context, name);
    }
  }

 /* void sendPhoneNumber(){
    String phoneNumber = phoneController.text.trim();
    if(country != null && phoneNumber.isNotEmpty){
      ref.read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    }
    else{
      showSnackBar(context: context, content:"Fill out all the fields");
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(22.0,100,22,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Just a step away !",style: TextStyle(fontSize: 22),),
                SizedBox(height: 15,),
                TextField(
                    keyboardType: TextInputType.name,
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    )
                ),
                SizedBox(height: 8,),
                TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Email ID',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    )
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22,0,22,22),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.deepPurpleAccent,
                ),
                width: double.infinity,

                child: TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(username: usernameController.text)));
                }, child:Text("Let's Start",style: TextStyle(color: Colors.white),))

            ),
          )
        ],
      ),
    );
  }
}
