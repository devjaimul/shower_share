
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shower_share/routes/route_name.dart';
import 'package:shower_share/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(RouteNames.onboardingScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.center,
            colors: [
              Color(0xffB2E8FF), // Top color (light)
              Color(0xffFFFFFF), // Bottom color (dark)
            ],
          ),
        ),
        child: Center(
          child: Image(
            image:  const AssetImage(AppImages.splashScreen),
            width: double.infinity, // Adjust as needed
            height: sizeH*.2, // Adjust as needed
          ),
        ),
      ),
    );
  }
}
