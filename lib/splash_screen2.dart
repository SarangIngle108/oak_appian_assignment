import 'dart:async';
import 'package:blackcoffer_assignment/auth/screens/login_screen.dart';
import 'package:blackcoffer_assignment/onboarding_screen.dart';
import 'package:blackcoffer_assignment/splash_screen1.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration:  Duration(seconds: 3),
      vsync: this)..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2),
            () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  OnboardingScreen()));
        }
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            AnimatedBuilder(
              animation: _controller,
              child: Container(
                height: 200,
                width: 200,
                child: const Center(
                  child: Image(image: AssetImage('assets/images/img.png'),),
                ),
              ),
              builder: (BuildContext context,Widget? child){
                return Transform.rotate(
                  angle: _controller.value * 0.0 * math.pi,
                  child: child,
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
            const Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text('  Craft My Plate',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('   You Customise, we cater',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.amber),),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}