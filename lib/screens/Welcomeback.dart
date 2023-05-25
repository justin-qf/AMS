import 'package:booking_app/core/constants/assets.dart';
import 'package:booking_app/core/themes/font_constant.dart';
import 'package:booking_app/screens/phone.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../core/Common/util.dart';

class WelcomebackPage extends StatefulWidget {
  const WelcomebackPage({super.key});

  @override
  State<WelcomebackPage> createState() => _WelcomebackPageState();
}

class _WelcomebackPageState extends State<WelcomebackPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(Asset.bg, fit: BoxFit.cover),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 35.sp),
                padding: EdgeInsets.only(
                  top: 8.h,
                ),
                child: Text(
                  'Welcome Back !',
                  style: TextStyle(
                      fontFamily: opensans_Bold,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.only(right: 75.sp),
                  child: Text(
                    'Sign Into Your Account',
                    style: TextStyle(
                        fontFamily: opensans_Bold,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 7.0.w, right: 7.0.w, top: 6.h, bottom: 5.h),
                  child: Form(
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
                                      fontFamily: opensans_Bold,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.0.h,
                            ),
                            Container(
                              height: 5.5.h,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'info@xyz.com',
                                ),
                                controller: _email,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  'Password',
                                  style: TextStyle(
                                      fontFamily: opensans_Bold,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.0.h),
                            Container(
                              height: 5.5.h,
                              child: TextField(
                                obscureText: _isHidden,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                    hintText: '********',
                                    suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(
                                        _isHidden
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                        size: 20.sp,
                                      ),
                                    )),
                                controller: _password,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                                width: 150.h,
                                height: 6.h,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Phone()));
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
                                          fontSize: 14.5.sp,
                                          fontFamily: opensans_Bold,
                                          fontWeight: FontWeight.w700),
                                    ))),
                          ],
                        ),
                      )),
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
                          fontFamily: opensans_Bold,
                          fontSize: 15.sp,
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
                      height: 4.5.h,
                      width: 4.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      child: Icon(
                        FontAwesomeIcons.googlePlusG,
                        size: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4.5.w),
                    Container(
                      height: 4.5.h,
                      width: 4.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      child: Icon(
                        FontAwesomeIcons.facebookF,
                        size: 16.sp,
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
                                fontWeight: FontWeight.w500,
                                fontFamily: opensansMedium,
                                fontSize: 14.sp),
                            children: [
                          TextSpan(
                            text: 'Don’t have an account?  ',
                          ),
                          TextSpan(
                              text: 'Sign up ',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Click');
                                },
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 1.5,
                                  color: Color.fromARGB(255, 77, 180, 224),
                                  fontFamily: opensans_Bold,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700)),
                        ])),
                  ],
                )
              ]),
            ],
          ),
        )
      ]),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
