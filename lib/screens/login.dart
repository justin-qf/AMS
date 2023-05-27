import 'package:animate_do/animate_do.dart';
import 'package:booking_app/core/constants/assets.dart';
import 'package:booking_app/core/themes/font_constant.dart';
import 'package:booking_app/screens/Changepassword.dart';
import 'package:booking_app/screens/phone.dart';
import 'package:booking_app/screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../core/Common/util.dart';
import '../core/constants/strings.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard(context);
      },
      child: Scaffold(
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
                          FadeInDown(
                            from: 50,
                            child: Center(
                              child: SvgPicture.asset(
                                Asset.ams_logo,
                                height: 10.h,
                                width: 20.w,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 5.w),
                            child: FadeInDown(
                              from: 50,
                              child: Text(
                                Strings.title,
                                style: TextStyle(
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: fontUrbanistBlack),
                              ),
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
                                margin: EdgeInsets.only(right: 2.w),
                                child: FadeInDown(
                                  from: 50,
                                  child: Text(
                                    Strings.signInAccount,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: opensans_Bold,
                                        fontWeight: FontWeight.w700),
                                  ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Strings.emailId,
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
                                        contentPadding: EdgeInsets.only(
                                            top: 1.h, left: 3.5.h, bottom: 1.h),
                                        hintText: Strings.email_id,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      controller: _email,
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        Strings.password,
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
                                          hintText: Strings.password_hint,
                                          contentPadding: EdgeInsets.only(
                                              top: 1.h,
                                              left: 3.5.h,
                                              bottom: 1.h),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
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
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Changepassword(),
                                              ));
                                        },
                                        child: Text(
                                          Strings.forgot_pass,
                                          style: TextStyle(
                                              fontFamily: opensans_Bold,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  FadeInUp(
                                    from: 50,
                                    child: SizedBox(
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
                                                        BorderRadius.circular(
                                                            50))),
                                            child: Text(
                                              Strings.sing_in,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.5.sp,
                                                  fontFamily: opensans_Bold,
                                                  fontWeight: FontWeight.w700),
                                            ))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.5.h,
                          ),
                          FadeInUp(
                            from: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,

                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                getDivider(),
                                Text(
                                  'Or',
                                  style: TextStyle(
                                      fontFamily: opensans_Bold,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                getDivider(),
                              ],
                            ),
                          ),
                        ])),
                  ),
                  SizedBox(
                    height: 1.3.h,
                  ),
                  FadeInUp(
                    from: 50,
                    child: Row(
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
                  ),
                  SizedBox(
                    height: 3.7.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeInUp(
                        from: 50,
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: opensansMedium,
                                    fontSize: 14.sp),
                                children: [
                              TextSpan(
                                text: Strings.havnt_account,
                              ),
                              TextSpan(
                                  text: Strings.sing_up,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => signuppage(),
                                          ));
                                    },
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 1.5.sp,
                                      color: Color.fromARGB(255, 77, 180, 224),
                                      fontFamily: opensans_Bold,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700)),
                            ])),
                      ),
                    ],
                  )
                ],
              ),
            )
          ])),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
