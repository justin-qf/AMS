import 'package:booking_app/screens/signup2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/themes/font_constant.dart';

class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  TextEditingController _vendorname = TextEditingController();
  TextEditingController _companyname = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _personname = TextEditingController();
  TextEditingController _contact1 = TextEditingController();
  TextEditingController _contact2 = TextEditingController();
  TextEditingController _whatsapp = TextEditingController();
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
                            'Vendor Name',
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
                        height: 5.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Name',
                            contentPadding: EdgeInsets.only(
                                top: 1.h, left: 2.h, bottom: 1.h),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          controller: _vendorname,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Company Name',
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
                        height: 5.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Company Name',
                            contentPadding: EdgeInsets.only(
                                top: 1.h, left: 2.h, bottom: 1.h),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          controller: _companyname,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Company Address',
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
                        height: 8.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Company Address',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          controller: _address,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email Id',
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
                        height: 5.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Email ID',
                            contentPadding: EdgeInsets.only(
                                top: 1.h, left: 2.h, bottom: 1.h),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          controller: _email,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
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
                        height: 5.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            contentPadding: EdgeInsets.only(
                                top: 1.h, left: 2.h, bottom: 1.h),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          controller: _password,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Person Name',
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
                        height: 5.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Name',
                            contentPadding: EdgeInsets.only(
                                top: 1.h, left: 2.h, bottom: 1.h),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          controller: _personname,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact No.1',
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
                        height: 5.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Contact No.1',
                            contentPadding: EdgeInsets.only(
                                top: 1.h, left: 2.h, bottom: 1.h),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          controller: _contact1,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact No.2',
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
                        height: 5.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Contact No.2',
                            contentPadding: EdgeInsets.only(
                                top: 1.h, left: 2.h, bottom: 1.h),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          controller: _contact2,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Whatsapp No',
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
                        height: 5.h,
                        child: TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: 'Enter Whatsapp No',
                            contentPadding: EdgeInsets.only(
                                top: 1.h, left: 2.h, bottom: 1.h),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          controller: _whatsapp,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      SizedBox(
                          width: 150.h,
                          height: 6.h,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Signup2()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              child: Text(
                                'Next',
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
        ]));
  }
}
