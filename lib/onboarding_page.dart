import 'package:flutter/material.dart';

import '../auth/screens/login_screen.dart';


class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;


  OnboardingPage({required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageUrl, height: 200, width: 200),
        SizedBox(height: 25,),
        Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black)),
        SizedBox(height: 16,),
        Text(description, style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
        SizedBox(height: 30,),

        // Use AssetImage for local images
        Padding(
          padding: const EdgeInsets.all(22.0),
          child: SizedBox(

            height: 45,
            width: double.infinity,
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
              ),
              onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text("Get Started",style: TextStyle(fontSize: 17,color: Colors.white),),
            ),
          ),
        )
      ],
    );
  }
}
