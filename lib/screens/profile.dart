import 'package:booking_app/core/themes/font_constant.dart';
import 'package:booking_app/screens/homepage.dart';
import 'package:booking_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../Models/Staff_model.dart';
import '../Models/service.dart';
import '../Models/service_model.dart';
import '../Models/staff.dart';
import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with TickerProviderStateMixin {
  late TabController tabController;
  List<ServiceItem> staticData = SettingsItems;
  List<StaffItem> staticData1 = StaffItems;
  var currentPage = 0;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Colors.white,
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
                  margin: EdgeInsets.only(top: 0.5.h, right: 3.5.h),
                  child: Center(
                      child: Column(
                    children: [
                      HomeAppBar(
                        title: 'Profile',
                        leading: Asset.backbutton,
                        isfilter: false,
                        icon: Asset.filter,
                        isBack: true,
                        onClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => home(),
                              ));
                        },
                      ),
                    ],
                  )))),
          Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 13.h),
                  child: SvgPicture.asset(Asset.profileimg, height: 10.h),
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'Kim Se-jeong',
                style: TextStyle(
                    fontFamily: opensansMedium,
                    fontSize: 16.5.sp,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 25.h),
            child: SafeArea(
              child: getListViewItem(),
            ),
          ),
        ]));
  }

  getListViewItem() {
    return DefaultTabController(
        length: 3,
        child: Column(children: [
          SizedBox(
            height: 1.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getTab("Basic", 30, 0),
              getTab("Staff", 30, 1),
              getTab("Service", 30, 2),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                Container(
                    child: Container(
                  margin: EdgeInsets.only(
                      top: 5.h, left: 8.w, right: 8.w, bottom: 1.h),
                  child: Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 1.5.h, left: 6.w, right: 4.w, bottom: 1.5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Vendor Type :',
                                style: TextStyle(
                                    fontFamily: opensansMedium,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 13.5.sp),
                              ),
                              IconButton(
                                  alignment: Alignment.topRight,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                signuppage()));
                                  },
                                  icon: SvgPicture.asset(Asset.edit))
                            ],
                          ),
                          SizedBox(height: 0.5.h),
                          Text(
                            'ABC',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Company Name :',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontSize: 13.5.sp),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            'Sam san Tech',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Address :',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontSize: 13.5.sp),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            'Seoul, Korea',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Contact No.1 :',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontSize: 13.5.sp),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            '+91 1234567890',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Contact No.2 :',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontSize: 13.5.sp),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            '+91 1234567890',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 0.1,
                              blurRadius: 10,
                              offset: Offset(0.5, 0.5)),
                        ],
                      ),
                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(top: 3.h),
                  child: ListView.builder(
                      shrinkWrap: false,
                      clipBehavior: Clip.antiAlias,
                      itemBuilder: (context, index) {
                        StaffItem data = staticData1[index];

                        return Container(
                          margin: EdgeInsets.only(
                              top: 1.5.h, left: 8.w, right: 8.w, bottom: 1.5.h),
                          child: Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 1.5.h,
                                  left: 4.w,
                                  right: 4.w,
                                  bottom: 1.5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Stack(children: [
                                        CircleAvatar(
                                          radius: 3.7.h,
                                          backgroundColor: Colors.white,
                                          child: SvgPicture.asset(
                                            Asset.profileimg,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ]),
                                      SizedBox(width: 3.w),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: Text(
                                              data.title,
                                              style: TextStyle(
                                                  fontFamily: opensansMedium,
                                                  fontSize: 15.5.sp,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Text(
                                              data.number,
                                              style: TextStyle(
                                                  fontFamily: opensansMedium,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 0.1,
                                      blurRadius: 10,
                                      offset: Offset(0.5, 0.5)),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: staticData1.length),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3.h),
                  child: ListView.builder(
                      shrinkWrap: false,
                      clipBehavior: Clip.antiAlias,
                      itemBuilder: (context, index) {
                        ServiceItem data = staticData[index];

                        return Container(
                          margin: EdgeInsets.only(
                              top: 1.5.h, left: 8.w, right: 8.w, bottom: 1.h),
                          child: Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 1.5.h,
                                  left: 4.w,
                                  right: 4.w,
                                  bottom: 1.5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: data.icon,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Container(
                                        child: Text(
                                          data.Name,
                                          style: TextStyle(
                                              fontFamily: opensansMedium,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 0.1,
                                      blurRadius: 10,
                                      offset: Offset(0.5, 0.5)),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: staticData.length),
                ),
              ],
            ),
          ),
        ]));
  }

  getTab(str, pad, index) {
    return Bounce(
      duration: Duration(milliseconds: 200),
      onPressed: (() {
        currentPage = index;
        if (tabController.indexIsChanging == false) {
          tabController.index = index;
        }
        setState(() {});
      }),
      child: AnimatedContainer(
        width: 90,

        //width: 50.w,
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        padding: EdgeInsets.only(left: 15, right: 15, top: 11, bottom: 11),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: currentPage == index ? Colors.black : Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 0.1,
                color: Colors.black.withOpacity(.1),
              )
            ],
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              str,
              style: TextStyle(
                  fontSize: 12.5.sp,
                  fontFamily: opensans_Bold,
                  fontWeight: FontWeight.w700,
                  color:
                      currentPage == index ? Colors.white : Colors.grey[850]),
            ),
            SizedBox(
              width: currentPage == index ? 8 : 0,
            ),
          ],
        ),
      ),
    );
  }
}
