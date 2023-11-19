import 'package:blackcoffer_assignment/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/utils.dart';
import '../controller/auth_controller.dart';

class OTPScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verificationId;
  final String phoneNumber;
   OTPScreen(
      {Key? key, required this.verificationId, required this.phoneNumber})
      : super(key: key);

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, verificationId, userOTP);
  }
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text("We have sent an verification code to"),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${phoneNumber}"),
                  Icon(
                    Icons.access_alarm_outlined,
                    color: Colors.green,
                  )
                ],
              ),
              SizedBox(
                width: size.width * 0.5,
                child: TextField(
                  controller: otpController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: "_ _ _ _ _ _",
                        hintStyle: TextStyle(
                          fontSize: 30,
                        )),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      if (val.length == 6) {
                        verifyOTP(ref, context, val.trim());
                      }
                    }),
              ),
              InkWell(

                child: Container(
                  color: Colors.deepPurple,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 19,
                  child: Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't recieve code? "),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Text(
                        "Resend Again",
                        style: TextStyle(color: Colors.deepPurple),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
