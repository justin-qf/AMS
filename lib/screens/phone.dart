import 'package:booking_app/core/constants/assets.dart';
import 'package:booking_app/core/themes/font_constant.dart';
import 'package:booking_app/screens/Otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController _phonenumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                      fontFamily: fontUrbanistExtraBold,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.only(right: 40.sp),
                  child: Text(
                    'We’ll send You Verification Code',
                    style: TextStyle(
                        fontFamily: fontUrbanistExtraBold,
                        fontSize: 15.sp,
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
                                  'Mobile Number',
                                  style: TextStyle(
                                      fontFamily: fontUrbanistBold,
                                      fontSize: 17.5.sp,
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
                                  hintText: '+91 1234567890',
                                ),
                                controller: _phonenumber,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              height: 3.0.sp,
                            ),
                            SizedBox(
                              height: 70.sp,
                            ),
                            SizedBox(
                                width: 370.sp,
                                height: 40.sp,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Otp()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    child: Text(
                                      'Get OTP',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.5.sp,
                                          fontFamily: fontUrbanistBold,
                                          fontWeight: FontWeight.w700),
                                    ))),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                SizedBox(
                  height: 4.0.h,
                ),
              ]),
            ],
          ),
        )
      ]),
    );
  }
}
