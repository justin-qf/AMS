import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:booking_app/Screens/IntroScreen%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../core/constants/assets.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SizedBox(
          child: AnimatedSplashScreen(
              splash: SvgPicture.asset(Asset.splash_bg,
                  width: SizerUtil.width, fit: BoxFit.cover),
              duration: 2000,
              splashIconSize: double.infinity,
              splashTransition: SplashTransition.fadeTransition,
              animationDuration: Duration(seconds: 3),
              nextScreen: IntroScreen())),
    );
  }
}
