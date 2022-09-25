import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winch_project/screens/splash.dart';

import '../Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // عشان الراجل يدخل
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      Timer(const Duration(seconds: 3), () {
        if (user == null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Splash()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Splash()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 150.0,
                  width: 150.0,
                ),
                const Text(
                  "Winch Company",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 33.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
