import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/constants/strings.dart';
import '../core/themes/font_constant.dart';

class ReportBug extends StatefulWidget {
  const ReportBug({super.key});

  @override
  State<ReportBug> createState() => _ReportBugState();
}

class _ReportBugState extends State<ReportBug> {
  TextEditingController _vendor = TextEditingController();
  TextEditingController _img = TextEditingController();
  TextEditingController _video = TextEditingController();
  TextEditingController _notes = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  title: Strings.report_title,
                  leading: Asset.backbutton,
                  isfilter: false,
                  icon: Asset.filter,
                  isBack: true,
                  onClick: () {},
                ),
              ])))),
      Container(
        margin: EdgeInsets.only(top: 8.h, left: 1.0.w, right: 1.0.w),
        padding:
            EdgeInsets.only(left: 7.0.w, right: 7.0.w, top: 4.h, bottom: 1.h),
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
                        Strings.select_vendor,
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
                        hintText: Strings.select_vendor,
                        contentPadding:
                            EdgeInsets.only(top: 1.h, left: 2.h, bottom: 1.h),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
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
                        Strings.upload_img,
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
                          hintText: Strings.add_img,
                          contentPadding:
                              EdgeInsets.only(top: 1.h, left: 2.h, bottom: 1.h),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          suffixIcon: Icon(Icons.arrow_drop_down_sharp)),
                      controller: _img,
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
                        Strings.upload_video,
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
                          hintText: Strings.add_video,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.photo_album_sharp))),
                      controller: _video,
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
                        Strings.note,
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
                          hintText: Strings.add_note,
                          // contentPadding:
                          //     EdgeInsets.only(top: 1.h, left: 2.h, bottom: 1.h),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: Icon(Icons.calendar_month)),
                      controller: _notes,
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
    ]));
  }
}
