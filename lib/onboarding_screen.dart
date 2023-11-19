import 'package:blackcoffer_assignment/auth/screens/login_screen.dart';
import 'package:blackcoffer_assignment/home_screen.dart';
import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import 'onbording_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<OnboardingPage> onboardingPages = [
    OnboardingPage(
      title: 'Create Your Own Plate',
      description: 'Create unforgettable memories with our unique feature ti curate your favorite cuisines and food,tailored to your special accassion',
      imageUrl: 'assets/images/on1.png',
    ),
    OnboardingPage(
      title: 'Exquisite Catering',
      description: 'Experience culliniary artistry like never before with our innovative and exquisite cuisine creations',
      imageUrl: 'assets/images/on2.png',
    ),
    OnboardingPage(
      title: 'Personal Order Executive',
      description: 'Embark on a personalised cullinary journey with our dedicated one-to-one customer support, ensuring a seamless and  satisfying experience every step of the way',
      imageUrl: 'assets/images/on3.png',
    ),
    // Add more OnboardingPage instances as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingPages.length,
        itemBuilder: (context, index) {
          return onboardingPages[index];
        },

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          // Move to the next page
          if (_pageController.page! < onboardingPages.length - 1) {
            _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          }
        },
        child: Icon(Icons.arrow_forward,color: Colors.white,),
      ),
    );
  }
}
