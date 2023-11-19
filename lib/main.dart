import 'package:blackcoffer_assignment/auth/screens/login_screen.dart';
import 'package:blackcoffer_assignment/auth/screens/otp_screen.dart';
import 'package:blackcoffer_assignment/firebase_options.dart';
import 'package:blackcoffer_assignment/home_screen.dart';
import 'package:blackcoffer_assignment/splash_screen.dart';
import 'package:blackcoffer_assignment/splash_screen1.dart';
import 'package:blackcoffer_assignment/user_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth/screens/user_info.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options:DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const SplashScreen(),
    );
  }
}


