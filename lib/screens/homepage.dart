import 'package:animate_do/animate_do.dart';
import 'package:booking_app/core/constants/assets.dart';
import 'package:booking_app/core/themes/font_constant.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../Models/expert.dart';
import '../Models/expert_model.dart';
import '../Models/offers.dart';
import '../Models/offers_model.dart';
import '../Models/service_item_model.dart';
import '../Models/service_name.dart';
import '../core/Common/appbar.dart';
import 'notification.dart';

class home extends StatefulWidget {
  home({super.key, this.openDrawer});
  GlobalKey<ScaffoldState>? openDrawer;

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var icon;
  var leading;
  var isfilter;
  var title;
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();
  List<Service_Item> staticData = ServicesItems;
  List<ExpertItem> staticData1 = expertItems;
  List<OfferItem> staticData2 = offersItems;
  bool state = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    return Scaffold(
        floatingActionButton: Visibility(
          visible: false,
          child: Container(
            width: 6.1.h,
            height: 6.1.h,
            margin: EdgeInsets.only(bottom: 11.h, right: 1.5.h),
            child: RawMaterialButton(
              fillColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Icon(
                Icons.add,
                size: 3.5.h,
                color: Colors.white,
              ),
              onPressed: () => widget.openDrawer!.currentState!
                  .openDrawer(), // <-- Opens drawer
            ),
          ),
        ),
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
            margin: EdgeInsets.only(top: 5.h),
            // padding: EdgeInsets.only(left: 1.h, right: 1.h),
            child: Column(
              children: [
                FadeInDown(
                  from: 50,
                  child: Container(
                    child: HomeAppBar(
                      openDrawer: widget.openDrawer,
                      title: 'Book My Appointment',
                      leading: Asset.backbutton,
                      isfilter: true,
                      isBack: false,
                      onClick: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (
                              context,
                            ) =>
                                    notification(this.icon, this.leading)));
                      },
                      icon: Asset.filter,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5.h, top: 3.h, left: 3.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FadeInDown(
                            from: 70,
                            child: Text(
                              'March 22, 2023',
                              style: TextStyle(
                                  fontSize: 16.5.sp,
                                  fontFamily: opensansMedium,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 9.h),
                            child: FadeInDown(
                              from: 70,
                              child: Text(
                                '04:48 PM',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: opensansMedium),
                              ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
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
                Container(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: DatePicker(
                    DateTime.now(),
                    width: 7.h,
                    height: 10.h,
                    controller: _controller,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.black,
                    selectedTextColor: Colors.white,
                    inactiveDates: [
                      // DateTime.now().add(Duration(days: 3)),
                    ],
                    onDateChange: (date) {
                      setState(() {
                        _selectedValue = date;
                      });
                    },
                  ),
                ),
                Divider(
                  endIndent: 3.h,
                  indent: 3.h,
                  thickness: 0.5.sp,
                  height: 5.h,
                  color: Colors.grey,
                ),
                Container(
                  margin: EdgeInsets.only(left: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Services',
                        style: TextStyle(
                            fontFamily: opensansMedium, fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 13.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.antiAlias,
                      itemBuilder: (context, index) {
                        Service_Item data = staticData[index];
                        return Container(
                          width: 37.w,
                          margin: EdgeInsets.only(left: 3.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.1,
                                  blurRadius: 3,
                                  offset: Offset(0.5, 0.5)),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 0.5.h, left: 1.w, right: 1.w),
                                height: 11.h,
                                width: 100.w,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: data.icon),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.Name,
                                    style: TextStyle(
                                      fontSize: 10.5.sp,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: staticData.length),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Experts',
                        style: TextStyle(
                            fontFamily: opensansMedium, fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 13.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.antiAlias,
                      itemBuilder: (context, index) {
                        ExpertItem data = staticData1[index];
                        return Container(
                          width: 37.w,
                          margin: EdgeInsets.only(left: 3.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.1,
                                  blurRadius: 3,
                                  offset: Offset(0.5, 0.5)),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 0.5.h, left: 1.w, right: 1.w),
                                height: 11.h,
                                width: 100.w,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: data.icon),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.Name,
                                    style: TextStyle(
                                      fontSize: 10.5.sp,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: staticData1.length),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 3.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Offers',
                        style: TextStyle(
                            fontFamily: opensansMedium, fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                // ),
                // Container(
                //   height: 13.h,
                //   child: ListView.builder(
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       clipBehavior: Clip.antiAlias,
                //       itemBuilder: (context, index) {
                //         Service_Item data = staticData[index];
                //         return Container(
                //           width: 37.w,
                //           margin: EdgeInsets.only(left: 3.h),
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.all(Radius.circular(10)),
                //             boxShadow: [
                //               BoxShadow(
                //                   color: Colors.black.withOpacity(0.2),
                //                   spreadRadius: 0.1,
                //                   blurRadius: 3,
                //                   offset: Offset(0.5, 0.5)),
                //             ],
                //           ),
                //           child: Column(
                //             children: [
                //               Container(
                //                 padding: EdgeInsets.only(
                //                     top: 0.5.h, left: 1.w, right: 1.w),
                //                 height: 11.h,
                //                 width: 100.w,
                //                 child: ClipRRect(
                //                     borderRadius: BorderRadius.circular(10),
                //                     child: data.icon),
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text(
                //                     data.Name,
                //                     style: TextStyle(
                //                       fontSize: 10.5.sp,
                //                     ),
                //                   ),
                //                 ],
                //               )
                //             ],
                //           ),
                //         );
                //       },
                //       itemCount: staticData.length),
                // ),
                Container(
                  margin: EdgeInsets.only(
                      top: 1.h, left: 8.w, right: 8.w, bottom: 1.h),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 1.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: SvgPicture.asset(Asset.bluestar),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Hair Smoothening',
                                      style: TextStyle(
                                          fontFamily: opensansMedium,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.5.sp),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 4.7.h),
                                    child: Text(
                                      'Flat 15% Off',
                                      style: TextStyle(
                                          fontFamily: opensans_Bold,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
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
                              )
                            ]),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          height: 5.h,
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '     Valid till: 26 March',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(10))),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
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
              ],
            ),

            // Column(children: [
            //   Container(
            //     margin: EdgeInsets.only(top: 5.5.h),
            //     child: Center(
            //       child: Column(children: [
            //         HomeAppBar(
            //           openDrawer: widget.openDrawer,
            //           title: 'Book My Appointment',
            //           isfilter: false,
            //           icon: 'filter',
            //         )
            //       ]),
            //     ),
            //   ),
            //   Container(
            //     margin: EdgeInsets.only(bottom: 35.h, top: 15.h, left: 2.6.h),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             Text(
            //               'March 22, 2023',
            //               style: TextStyle(
            //                   fontSize: 2.5.h, fontFamily: fontUrbanistBlack),
            //             ),
            //             Container(
            //               margin: EdgeInsets.only(right: 7.5.h),
            //               child: Text(
            //                 '04:48 PM',
            //                 style: TextStyle(
            //                     fontSize: 2.5.h, fontFamily: fontUrbanistMedium),
            //               ),
            //             ),
            //           ],
            //         ),

            //         InkWell(
            //           focusColor: Colors.amber,
            //           child: Container(
            //             margin: EdgeInsets.only(
            //               right: 3.5.h,
            //             ),
            //             height: 6.1.h,
            //             width: 6.1.h,
            //             decoration: BoxDecoration(
            //                 color: Colors.black,
            //                 borderRadius: BorderRadius.all(Radius.circular(15))),
            //             child: Container(
            //               padding: EdgeInsets.all(12),
            //               child: SvgPicture.asset(
            //                 Asset.calender,
            //                 color: Colors.white,
            //                 height: 1.sp,
            //                 width: 1.sp,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ]),
            // floatingActionButton: Container(
            //   width: 6.1.h,
            //   height: 6.1.h,
            //   margin: EdgeInsets.only(bottom: 10.h, right: 1.5.h),
            //   child: RawMaterialButton(
            //     fillColor: Colors.black,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(15))),
            //     child: Icon(
            //       Icons.add,
            //       size: 3.5.h,
            //       color: Colors.white,
            //     ),
            //     onPressed: () =>
            //         widget.openDrawer.currentState!.openDrawer(), // <-- Opens drawer
            //   ),
            // ),
          ),
        ]));
  }
}
