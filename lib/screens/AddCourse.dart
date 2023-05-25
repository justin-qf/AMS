import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/themes/font_constant.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  TextEditingController _customername = TextEditingController();
  TextEditingController _profile = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _doa = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _contact1 = TextEditingController();
  TextEditingController _contact2 = TextEditingController();
  TextEditingController _email = TextEditingController();
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
                      title: 'Add Course',
                      leading: Asset.backbutton,
                      isfilter: false,
                      icon: Asset.filter,
                      isBack: true,
                      onClick: () {},
                    ),
                  ])))),
          Container(
            margin: EdgeInsets.only(top: 8.h, left: 1.0.w, right: 1.0.w),
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
                            'Student',
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
                            hintText: 'Select Student',
                            contentPadding: EdgeInsets.only(
                                top: 1.h, left: 2.h, bottom: 1.h),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          controller: _customername,
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
                            'Course',
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
                              hintText: 'Select Course',
                              contentPadding: EdgeInsets.only(
                                  top: 1.h, left: 2.h, bottom: 1.h),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              suffixIcon: Icon(Icons.arrow_drop_down_sharp)),
                          controller: _profile,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fees',
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
                            hintText: '₹ 2000',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          controller: _dob,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Starting From',
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
                              hintText: 'Select Date',
                              contentPadding: EdgeInsets.only(
                                  top: 1.h, left: 2.h, bottom: 1.h),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              suffixIcon: Icon(Icons.calendar_month)),
                          controller: _doa,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
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
                        height: 7.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Add Description',
                            contentPadding: EdgeInsets.only(
                                top: 1.h, left: 2.h, bottom: 1.h),
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
                        height: 2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Other Notes',
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
                        height: 7.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Add Notes',
                            contentPadding: EdgeInsets.only(
                                top: 1.h, left: 2.h, bottom: 1.h),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          controller: _contact1,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Id Proof',
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
                        height: 7.h,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Add Photo',
                              contentPadding: EdgeInsets.only(
                                  top: 1.h, left: 2.h, bottom: 1.h),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.photo_sharp))),
                          controller: _contact1,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      SizedBox(
                          width: 150.h,
                          height: 6.h,
                          child: ElevatedButton(
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => const Signup2()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              child: Text(
                                'Submit',
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