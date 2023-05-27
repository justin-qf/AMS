import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../core/constants/assets.dart';
import '../core/constants/strings.dart';
import '../core/themes/font_constant.dart';
import 'login.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  TextEditingController _previouspass = TextEditingController();
  TextEditingController _newpass = TextEditingController();
  TextEditingController _confirmpass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool _isHidden1 = true;

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Container(
                  margin: EdgeInsets.only(
                    right: 8.h,
                  ),
                  padding: EdgeInsets.only(
                    top: 8.h,
                  ),
                  child: Text(
                    Strings.change_pass,
                    style: TextStyle(
                        fontFamily: opensans_Bold,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 7.0.w,
                          right: 7.0.w,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Asset.changepass,
                                height: 25.h,
                                width: 15.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 7.0.w, right: 7.0.w, top: 3.h, bottom: 3.h),
                        child: Form(
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
                                        Strings.previous_pass,
                                        style: TextStyle(
                                            fontFamily: opensans_Bold,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.0.h,
                                  ),
                                  Container(
                                    height: 5.7.h,
                                    child: TextField(
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 1.h, left: 3.h, bottom: 1.h),
                                        hintText: Strings.enter_previous_pass,
                                        hintStyle: TextStyle(fontSize: 12.sp),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      controller: _previouspass,
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
                                        Strings.new_pass,
                                        style: TextStyle(
                                            fontFamily: opensans_Bold,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.0.h),
                                  Container(
                                    height: 5.7.h,
                                    child: TextField(
                                      obscureText: _isHidden,
                                      obscuringCharacter: '*',
                                      decoration: InputDecoration(
                                          hintText: Strings.enter_new_pass,
                                          hintStyle: TextStyle(fontSize: 12.sp),
                                          contentPadding: EdgeInsets.only(
                                              top: 1.h, left: 3.h, bottom: 1.h),
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
                                      controller: _newpass,
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
                                        Strings.confirm_new_pass,
                                        style: TextStyle(
                                            fontFamily: opensans_Bold,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.0.h),
                                  Container(
                                    height: 5.7.h,
                                    child: TextField(
                                      obscureText: _isHidden1,
                                      obscuringCharacter: '*',
                                      decoration: InputDecoration(
                                          hintText: Strings.confirm_new_pass,
                                          contentPadding: EdgeInsets.only(
                                              top: 1.h, left: 3.h, bottom: 1.h),
                                          hintStyle: TextStyle(fontSize: 12.sp),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          suffixIcon: InkWell(
                                            onTap: _togglePasswordView1,
                                            child: Icon(
                                              _isHidden1
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.grey,
                                              size: 20.sp,
                                            ),
                                          )),
                                      controller: _confirmpass,
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                      width: 100.w,
                                      height: 6.h,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Loginpage()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50))),
                                          child: Text(
                                            Strings.submit,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.5.sp,
                                                fontFamily: opensans_Bold,
                                                fontWeight: FontWeight.w700),
                                          ))),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ]))
        ]));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _togglePasswordView1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }
}
