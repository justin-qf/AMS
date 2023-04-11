import 'package:booking_app/core/constants/assets.dart';
import 'package:booking_app/core/themes/font_constant.dart';
import 'package:booking_app/screens/Welcomeback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../core/Common/util.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(
            Asset.bg,
            fit: BoxFit.cover,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 7.0.w, right: 7.0.w, top: 8.h, bottom: 5.h),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          Asset.ams_logo,
                          height: 10.h,
                          width: 15.w,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5.w),
                        child: const Text(
                          'AMS',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              fontFamily: fontUrbanistBlack),
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const Text(
                              'Sign Into Your Account',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: fontUrbanistExtraBold,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Form(
                          key: _formKey,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email Id',
                                      style: TextStyle(
                                          fontFamily: fontUrbanistBold,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Container(
                                  height: 50,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 25),
                                      hintText: 'info@xyz.com',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                    controller: _email,
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Text(
                                      'Password',
                                      style: TextStyle(
                                          fontFamily: fontUrbanistBold,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.0),
                                Container(
                                  height: 50,
                                  child: TextField(
                                    obscureText: true,
                                    obscuringCharacter: '*',
                                    decoration: InputDecoration(
                                        hintText: '********',
                                        contentPadding: EdgeInsets.only(
                                            left: 25, right: 20),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        suffixIcon: Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                          size: 20.sp,
                                        )),
                                    controller: _password,
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                                SizedBox(
                                  height: 45.sp,
                                ),
                                SizedBox(
                                    width: 370.sp,
                                    height: 42.sp,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const WelcomebackPage()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50))),
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.5.sp,
                                              fontFamily: fontUrbanistBold,
                                              fontWeight: FontWeight.w700),
                                        ))),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 4.5.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          getDivider(),
                          Text(
                            'Or',
                            style: TextStyle(
                                fontFamily: fontUrbanistBold,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          getDivider(),
                        ],
                      ),
                      SizedBox(
                        height: 1.3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                            child: Icon(
                              FontAwesomeIcons.googlePlusG,
                              size: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black),
                            child: Icon(
                              FontAwesomeIcons.facebookF,
                              size: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.7.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: fontUrbanistBlack,
                                      fontSize: 15.sp),
                                  children: [
                                TextSpan(
                                  text: 'Don’t have an account?  ',
                                ),
                                TextSpan(
                                    text: 'Sign up ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 77, 180, 224),
                                        fontFamily: fontUrbanistBold,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700)),
                              ])),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
