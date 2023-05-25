import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/themes/font_constant.dart';

class VendorService extends StatefulWidget {
  const VendorService({super.key});

  @override
  State<VendorService> createState() => _VendorServiceState();
}

class _VendorServiceState extends State<VendorService> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _vendor = TextEditingController();
  TextEditingController _company = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();

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
                      title: 'Add Vendor Service',
                      leading: Asset.backbutton,
                      isfilter: false,
                      icon: Asset.filter,
                      isBack: true,
                      onClick: () {},
                    ),
                  ])))),
          Container(
              margin: EdgeInsets.only(top: 7.h, left: 1.0.w, right: 1.0.w),
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
                              'Field Name',
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
                                hintText: 'Enter Name',
                                contentPadding: EdgeInsets.only(
                                    top: 1.h, left: 2.h, bottom: 1.h),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                suffixIcon: IconButton(
                                    padding: EdgeInsets.only(bottom: 0.1.h),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      size: 5.h,
                                    ))),
                            controller: _vendor,
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
                              'Time',
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
                                hintText: 'Time',
                                contentPadding: EdgeInsets.only(
                                    top: 1.h, left: 2.h, bottom: 1.h),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                suffixIcon: Icon(Icons.watch_later_outlined)),
                            controller: _company,
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
                              'Approx Sittings',
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
                              hintText: '15',
                              contentPadding: EdgeInsets.only(
                                  top: 1.h, left: 2.h, bottom: 1.h),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
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
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Sitting Duration',
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
                                hintText: 'Sitting Duration',
                                contentPadding: EdgeInsets.only(
                                    top: 1.h, left: 2.h, bottom: 1.h),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                suffixIcon: Icon(Icons.watch_later_outlined)),
                            controller: _email,
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
                                  //         builder: (context) =>
                                  //             const Loginpage()));
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
