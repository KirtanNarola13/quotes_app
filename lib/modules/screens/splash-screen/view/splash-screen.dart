import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Get.offAllNamed('/home');
    });
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 300),
          Center(
            child: Lottie.asset('lib/json/splash.json', height: 200),
          ),
          const SizedBox(height: 300),
          const Text(
            ": Quote_App :",
            style: TextStyle(
              fontSize: 28,
              letterSpacing: 5,
            ),
          )
        ],
      ),
    );
  }
}
