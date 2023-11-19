import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/utils.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;
  bool login = false;

  void pickCountry(){
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        onSelect: (Country _country){
          setState(() {
            country = _country;
          });
        });
  }


  void sendPhoneNumber(){
    String phoneNumber = phoneController.text.trim();
    if(country != null && phoneNumber.isNotEmpty && phoneNumber.length==10){
      setState(() {
        login = !login;
      });
      ref.read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    }
    else{
      showSnackBar(context: context, content:"Fill out all the fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipPath(
                clipper: CurvedBottomClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple, // Set your desired color here
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),

                ),
              ),
              height: MediaQuery.of(context).size.height/4, // Set your desired height here
              width: double.infinity,
              child: Center(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/img.png",scale: 2,),
                      Text("CraftMyPlate",style: TextStyle(fontSize: 22,color: Colors.white),),
                    ],

                ),

              ),
            ),
          ),
                const SizedBox(height: 40,),
                const Text("Login or SignUp",style: TextStyle(fontSize: 22),),
                const SizedBox(height: 10,),

                TextButton(
                  onPressed:pickCountry,
                  child: const Text("pick country"),),
                const SizedBox(height: 5,),

                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(
                      children: [
                        if(country != null) Text('+${country!.phoneCode}'),
                        const SizedBox(width: 2),
                        Container(
                          width: size.width * 0.7,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            decoration: const InputDecoration(
                              hintText: "Phone Number",
                              fillColor: Colors.black,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 22),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple,
                  ),

                  height: MediaQuery.of(context).size.height/18,
                  width: double.infinity,
                  child: Center(child: TextButton(child: login==false?Text("Continue",style: TextStyle(color: Colors.white),):CircularProgressIndicator(), onPressed: sendPhoneNumber,)),
                ),
              ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: MediaQuery.of(context).size.height/19,
          child:
          Column(
            children: [
              Text("By continuing, you  agree to our"),
              Text("Terms of Service Privacy Policy")
            ],
          ),
        ),
      ),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
   path.moveTo(0, size.height*1);
    path.quadraticBezierTo(
        size.width / 2, size.height + 20, size.width, size.height);
    path.lineTo(size.width, 2);
    path.lineTo(0, 0);
    path.close();
    return path;

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
