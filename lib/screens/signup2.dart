import 'package:booking_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/themes/font_constant.dart';

class Signup2 extends StatefulWidget {
  const Signup2({super.key});

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _logo = TextEditingController();
  TextEditingController _breacher = TextEditingController();
  TextEditingController _profile = TextEditingController();
  TextEditingController _propertyimg = TextEditingController();

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
          SafeArea(
              minimum: EdgeInsets.only(top: 1.h),
              child: Container(
                  margin: EdgeInsets.only(
                    top: 0.5.h,
                  ),
                  child: Center(
                      child: Column(children: [
                    HomeAppBar(
                      title: 'Add Vendor',
                      leading: Asset.backbutton,
                      isfilter: false,
                      icon: Asset.filter,
                      isBack: true,
                      onClick: () {},
                    ),
                  ])))),
          Container(
              margin: EdgeInsets.only(top: 6.h, left: 1.0.w, right: 1.0.w),
              padding: EdgeInsets.only(
                  left: 7.0.w, right: 7.0.w, top: 4.h, bottom: 1.h),
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
                              'Logo',
                              style: TextStyle(
                                  fontFamily: opensans_Bold,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          height: 5.5.h,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Select Image(Logo)',
                                contentPadding: EdgeInsets.only(
                                    top: 1.h, left: 2.h, bottom: 1.h),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                suffixIcon: Icon(Icons.photo)),
                            controller: _logo,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Breachers',
                              style: TextStyle(
                                  fontFamily: opensans_Bold,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          height: 5.5.h,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Select Breachers',
                                contentPadding: EdgeInsets.only(
                                    top: 1.h, left: 2.h, bottom: 1.h),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                suffixIcon: Icon(Icons.photo)),
                            controller: _breacher,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Profile',
                              style: TextStyle(
                                  fontFamily: opensans_Bold,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          height: 5.5.h,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Select Profile',
                                contentPadding: EdgeInsets.only(
                                    top: 1.h, left: 2.h, bottom: 1.h),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                suffixIcon: Icon(Icons.photo)),
                            controller: _profile,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Property Images',
                              style: TextStyle(
                                  fontFamily: opensans_Bold,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          height: 5.5.h,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Select Property Images',
                                contentPadding: EdgeInsets.only(
                                    top: 1.h, left: 2.h, bottom: 1.h),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                suffixIcon: Icon(Icons.photo)),
                            controller: _propertyimg,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
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
                                              const Loginpage()));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.5.sp,
                                      fontFamily: opensans_Bold,
                                      fontWeight: FontWeight.w700),
                                ))),
                      ]))))
        ]));
  }
}
