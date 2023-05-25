import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:booking_app/screens/Intro.dart';
import 'package:booking_app/screens/Vendor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/constants/assets.dart';
import 'AddCourse.dart';
import 'AddCustomer.dart';
import 'AddProduct.dart';
import 'AddVendorService.dart';
import 'ReportBug.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    // Timer(const Duration(seconds: 5), () {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    // });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: SizedBox(
    //       height: double.infinity,
    //       width: double.infinity,
    //       child: SvgPicture.asset(Asset.bma_logo, fit: BoxFit.cover),
    //     ),
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SizedBox(
        child: AnimatedSplashScreen(
            splash: SvgPicture.asset(Asset.splash_bg, fit: BoxFit.cover),
            duration: 2000,
            splashIconSize: double.infinity,
            splashTransition: SplashTransition.fadeTransition,
            animationDuration: Duration(seconds: 3),
            nextScreen: OnboardingScreen()),
      ),
    );
  }
}
