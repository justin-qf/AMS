import 'package:booking_app/core/constants/assets.dart';
import 'package:booking_app/screens/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../core/Common/OTP_Textfield.dart';
import '../core/themes/font_constant.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  late TextEditingController otp1 = TextEditingController();
  late TextEditingController otp2 = TextEditingController();
  late TextEditingController otp3 = TextEditingController();
  late TextEditingController otp4 = TextEditingController();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  @override
  void initState() {
    super.initState();
  }

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
                  margin: EdgeInsets.only(right: 95.sp),
                  padding: EdgeInsets.only(
                    top: 8.h,
                  ),
                  child: Text(
                    'Verification',
                    style: TextStyle(
                        fontFamily: fontUrbanistExtraBold,
                        fontSize: 40,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 0.0.h,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 1.0.w,
                        ),
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
                                Asset.otp,
                                height: 40.h,
                                width: 30.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Text(
                              'Enter your OTP Code here',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: fontUrbanistMedium,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OtpInput(otp1, true, node1),
                          SizedBox(width: 4.5.w),
                          OtpInput(otp2, false, node2),
                          SizedBox(width: 4.5.w),
                          OtpInput(otp3, false, node3),
                          SizedBox(width: 4.5.w),
                          OtpInput(otp4, false, node4),
                        ],
                      ),
                      SizedBox(
                        height: 3.0.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Text(
                              'Didn’t you receive any code?',
                              style: TextStyle(
                                  fontSize: 13.5.sp,
                                  fontFamily: fontUrbanistMedium,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Text(
                              'RESEND NEW CODE',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: fontUrbanistBlack,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.sp,
                      ),
                      SizedBox(
                          width: 245.sp,
                          height: 42.sp,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const dashboard()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              child: Text(
                                'Verify',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.5.sp,
                                    fontFamily: fontUrbanistBold,
                                    fontWeight: FontWeight.w700),
                              ))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
