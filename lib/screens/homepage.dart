import 'package:booking_app/core/constants/assets.dart';
import 'package:booking_app/core/themes/font_constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../core/Common/appbar.dart';

class home extends StatefulWidget {
  home({super.key, required this.openDrawer});
  GlobalKey<ScaffoldState> openDrawer;

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
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
        Container(
          margin: EdgeInsets.only(top: 5.5.h),
          child: Center(
            child: Column(children: [
              HomeAppBar(
                openDrawer: widget.openDrawer,
                title: 'Book My Appointment',
                isfilter: false,
                icon: 'filter',
              )
            ]),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 35.h, top: 15.h, left: 2.6.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'March 22, 2023',
                    style: TextStyle(
                        fontSize: 2.5.h, fontFamily: fontUrbanistBlack),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 7.5.h),
                    child: Text(
                      '04:48 PM',
                      style: TextStyle(
                          fontSize: 2.5.h, fontFamily: fontUrbanistMedium),
                    ),
                  ),
                ],
              ),
              InkWell(
                focusColor: Colors.amber,
                child: Container(
                  margin: EdgeInsets.only(
                    right: 3.5.h,
                  ),
                  height: 6.1.h,
                  width: 6.1.h,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      Asset.calender,
                      color: Colors.white,
                      height: 1.sp,
                      width: 1.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      floatingActionButton: Container(
        width: 6.1.h,
        height: 6.1.h,
        margin: EdgeInsets.only(bottom: 10.h, right: 1.5.h),
        child: RawMaterialButton(
          fillColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Icon(
            Icons.add,
            size: 3.5.h,
            color: Colors.white,
          ),
          onPressed: () =>
              widget.openDrawer.currentState!.openDrawer(), // <-- Opens drawer
        ),
      ),
    );
  }
}
