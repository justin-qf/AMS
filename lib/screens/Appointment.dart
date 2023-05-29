import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../Models/notification_model.dart';
import '../Models/product.dart';
import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/themes/font_constant.dart';

class Appointment extends StatefulWidget {
  Appointment({super.key, this.openDrawer});
  GlobalKey<ScaffoldState>? openDrawer;

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment>
    with TickerProviderStateMixin {
  List<ProductItem> staticData = notificationItems;
  late TabController tabController;
  var currentPage = 0;
  bool _isOnline = true;
  var icon;
  var leading;
  var isfilter;
  var title;
  bool state = false;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SvgPicture.asset(
              Asset.bg,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                    top: 5.h,
                  ),
                  child: Center(
                      child: Column(children: [
                    HomeAppBar(
                      title: 'Appointment',
                      leading: Asset.backbutton,
                      isfilter: true,
                      icon: Asset.filter,
                      isBack: false,
                      onClick: () {},
                    ),
                  ]))),
              Expanded(
                child: getListViewItem(),
              ),
            ],
          )
        ],
      ),
    );
  }

  getListViewItem() {
    return DefaultTabController(
        length: 2,
        child: Column(children: [
          SizedBox(
            height: 2.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getTab("Upcoming", 30, 0),
              getTab("Previous", 30, 1),
            ],
          ),
          Expanded(
              child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                Container(
                  child: ListView.builder(
                      shrinkWrap: false,
                      clipBehavior: Clip.antiAlias,
                      itemBuilder: (context, index) {
                        ProductItem data = staticData[index];
                        return Container(
                          margin: EdgeInsets.only(
                              left: 7.w, right: 7.w, bottom: 1.h),
                          padding: EdgeInsets.only(
                              top: 2.h, left: 4.w, right: 4.w, bottom: 2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'March 22,2023',
                                style: TextStyle(
                                    fontFamily: opensansMedium,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                  SizedBox(width: 5.w),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Text(
                                                data.Name,
                                                style: TextStyle(
                                                    fontFamily: opensansMedium,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                            child: Text(
                                          data.title,
                                          style: TextStyle(
                                              fontFamily: opensansMedium,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w400),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    Asset.user,
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text('Ahn Hyeon Seop')
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 1.h),
                                    child: CupertinoSwitch(
                                      value: state,
                                      onChanged: (value) {
                                        state = value;
                                        setState(
                                          () {},
                                        );
                                      },
                                      thumbColor: CupertinoColors.white,
                                      activeColor: CupertinoColors.black,
                                      trackColor: Colors.grey,
                                    ),
                                  ),
                                  Text('Remind me'),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_drop_down)),
                                  Spacer(),
                                  SizedBox(
                                      width: 25.w,
                                      height: 4.h,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.5.sp,
                                              fontFamily: opensansMedium,
                                            ),
                                          ))),
                                ],
                              )
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
                        );
                      },
                      itemCount: staticData.length),
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: false,
                      clipBehavior: Clip.antiAlias,
                      itemBuilder: (context, index) {
                        ProductItem data = staticData[index];
                        return Container(
                          margin: EdgeInsets.only(
                              left: 7.w, right: 7.w, bottom: 1.h),
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 2.h, left: 4.w, right: 4.w, bottom: 2.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'March 22,2023',
                                  style: TextStyle(
                                      fontFamily: opensansMedium,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                    SizedBox(width: 5.w),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Text(
                                                  data.Name,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          opensansMedium,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                              child: Text(
                                            data.title,
                                            style: TextStyle(
                                                fontFamily: opensansMedium,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w400),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      Asset.user,
                                      height: 2.h,
                                    ),
                                    Text('Ahn Hyeon Seop')
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 1.h),
                                      child: CupertinoSwitch(
                                        value: state,
                                        onChanged: (value) {
                                          state = value;
                                          setState(
                                            () {},
                                          );
                                        },
                                        thumbColor: CupertinoColors.white,
                                        activeColor: CupertinoColors.black,
                                        trackColor: Colors.grey,
                                      ),
                                    ),
                                    Text('Remind me'),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.arrow_drop_down)),
                                    Spacer(),
                                    SizedBox(
                                        width: 25.w,
                                        height: 4.h,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.5.sp,
                                                fontFamily: opensansMedium,
                                              ),
                                            ))),
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
                        );
                      },
                      itemCount: staticData.length),
                )
              ]))
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
        width: 40.w,
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(
          horizontal: 3.5.w,
        ),
        padding:
            EdgeInsets.only(left: 5.w, right: 5.w, top: 1.3.h, bottom: 1.3.h),
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
              width: currentPage == index ? 4.w : 0,
            ),
            currentPage == index
                ? Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentPage == index ? Colors.white : null),
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 1, bottom: 1),
                    child: currentPage == index
                        ? Text("6", style: TextStyle(fontSize: 12.5.sp))
                        : null,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
