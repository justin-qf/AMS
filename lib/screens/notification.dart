import 'package:booking_app/Models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../Models/notification_model.dart';
import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/themes/font_constant.dart';
import '../dialogs/bottomsheetdialog.dart';

// ignore: must_be_immutable
class notification extends StatefulWidget {
  notification(this.icon, this.leading, {super.key});

  var icon;
  var leading;

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification>
    with TickerProviderStateMixin {
  List<ProductItem> staticData = notificationItems;
  late TabController tabController;
  var currentPage = 0;
  bool _isOnline = true;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                margin: EdgeInsets.only(
                  top: 0.5.h,
                ),
                child: Center(
                    child: Column(children: [
                  HomeAppBar(
                    title: 'Notifications',
                    leading: Asset.backbutton,
                    isfilter: false,
                    icon: Asset.filter,
                    isBack: true,
                    onClick: () {
                      showbottomsheetdialog(context);
                    },
                  ),
                ])))),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          child: SafeArea(
            child: getListViewItem(),
          ),
        ),
      ]),
    );
  }

  getListViewItem() {
    return DefaultTabController(
        length: 2,
        child: Column(children: [
          SizedBox(
            height: 3.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getTab("Upcoming", 30, 0),
              getTab("Previous", 30, 1),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 2.h, top: 2.h, left: 3.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'March 22,2023',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: opensansMedium,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
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
                                top: 1.h, left: 7.w, right: 7.w, bottom: 1.h),
                            child: Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 2.h,
                                    left: 4.w,
                                    right: 4.w,
                                    bottom: 2.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: _isOnline
                                                ? Container(
                                                    width: 2.h,
                                                    height: 2.h,
                                                    decoration: BoxDecoration(
                                                      color: data.Status ==
                                                              "Completed"
                                                          ? Colors.green
                                                          : data.Status ==
                                                                  'Pending'
                                                              ? Colors.orange
                                                              : Colors.red,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2),
                                                    ),
                                                  )
                                                : SizedBox(),
                                          )
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
                                                  Spacer(),
                                                  Text(
                                                    data.Status,
                                                    style: TextStyle(
                                                        color: data.Status ==
                                                                "Completed"
                                                            ? Colors.green
                                                            : data.Status ==
                                                                    'Pending'
                                                                ? Colors.orange
                                                                : Colors.red,
                                                        fontFamily:
                                                            opensans_Regular,
                                                        fontSize: 10.sp),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                  child: Text(
                                                data.title,
                                                style: TextStyle(
                                                    fontFamily: opensansMedium,
                                                    fontSize: 11.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                              Text(
                                                data.time,
                                                style: TextStyle(
                                                    fontFamily: opensansMedium,
                                                    fontSize: 10.5.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                  Container(
                    child: ListView.builder(
                        shrinkWrap: false,
                        clipBehavior: Clip.antiAlias,
                        itemBuilder: (context, index) {
                          ProductItem data = staticData[index];
                          return Container(
                            margin: EdgeInsets.only(
                                top: 1.h, left: 7.w, right: 7.w, bottom: 1.h),
                            child: Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 2.h,
                                    left: 4.w,
                                    right: 4.w,
                                    bottom: 2.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: _isOnline
                                                ? Container(
                                                    width: 2.h,
                                                    height: 2.h,
                                                    decoration: BoxDecoration(
                                                      color: data.Status ==
                                                              "Completed"
                                                          ? Colors.green
                                                          : data.Status ==
                                                                  'Pending'
                                                              ? Colors.orange
                                                              : Colors.red,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2),
                                                    ),
                                                  )
                                                : SizedBox(),
                                          )
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
                                                  Spacer(),
                                                  Text(
                                                    data.Status,
                                                    style: TextStyle(
                                                        color: data.Status ==
                                                                "Completed"
                                                            ? Colors.green
                                                            : data.Status ==
                                                                    'Pending'
                                                                ? Colors.orange
                                                                : Colors.red,
                                                        fontFamily:
                                                            opensans_Regular,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                  child: Text(
                                                data.title,
                                                style: TextStyle(
                                                    fontFamily: opensansMedium,
                                                    fontSize: 11.sp),
                                              )),
                                              Text(
                                                data.time,
                                                style: TextStyle(
                                                    fontFamily: opensansMedium,
                                                    fontSize: 10.5.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                  // Container(
                  //   child: ListView.builder(
                  //       shrinkWrap: false,
                  //       clipBehavior: Clip.antiAlias,
                  //       itemBuilder: (context, index) {
                  //         ProductItem data = staticData[index];
                  //         return Container(
                  //           margin: EdgeInsets.only(
                  //               top: 1.h, left: 5.w, right: 5.w),
                  //           child: Container(
                  //             padding: EdgeInsets.only(
                  //                 top: 2.h, left: 4.w, right: 4.w, bottom: 2.h),
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               children: [
                  //                 Row(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.center,
                  //                   children: [
                  //                     Stack(children: [
                  //                       CircleAvatar(
                  //                         radius: 3.7.h,
                  //                         backgroundColor: Colors.white,
                  //                         child: SvgPicture.asset(
                  //                           Asset.profileimg,
                  //                           fit: BoxFit.cover,
                  //                         ),
                  //                       ),
                  //                       Positioned(
                  //                         bottom: 0,
                  //                         right: 0,
                  //                         child: _isOnline
                  //                             ? Container(
                  //                                 width: 2.h,
                  //                                 height: 2.h,
                  //                                 decoration: BoxDecoration(
                  //                                   color: data.Status ==
                  //                                           "Completed"
                  //                                       ? Colors.green
                  //                                       : data.Status ==
                  //                                               'Pending'
                  //                                           ? Colors.orange
                  //                                           : Colors.red,
                  //                                   shape: BoxShape.circle,
                  //                                   border: Border.all(
                  //                                       color: Colors.white,
                  //                                       width: 2),
                  //                                 ),
                  //                               )
                  //                             : SizedBox(),
                  //                       )
                  //                     ]),
                  //                     SizedBox(
                  //                       width: 2.w,
                  //                     ),
                  //                     Container(
                  //                       child: Column(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.start,
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           Row(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.start,
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.center,
                  //                             children: [
                  //                               Container(
                  //                                 child: Text(
                  //                                   data.Name,
                  //                                   style: TextStyle(
                  //                                       fontFamily:
                  //                                           fontUrbanistBlack,
                  //                                       fontSize: 14.sp),
                  //                                 ),
                  //                               ),
                  //                              Spacer(),
                  //                               Text(
                  //                                 data.Status,
                  //                                 style: TextStyle(
                  //                                     color: data.Status ==
                  //                                             "Completed"
                  //                                         ? Colors.green
                  //                                         : data.Status ==
                  //                                                 'Pending'
                  //                                             ? Colors.orange
                  //                                             : Colors.red,
                  //                                     fontFamily:
                  //                                         fontUrbanistRegular,
                  //                                     fontSize: 12),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                           Container(
                  //                               child: Text(
                  //                             data.title,
                  //                             style: TextStyle(
                  //                                 fontFamily:
                  //                                     fontUrbanistRegular,
                  //                                 fontSize: 11.5.sp),
                  //                           )),
                  //                           Text(
                  //                             data.time,
                  //                             style: TextStyle(
                  //                               fontFamily: fontUrbanistRegular,
                  //                             ),
                  //                           )
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //             decoration: BoxDecoration(
                  //               color: Colors.white,
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(10)),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                     color: Colors.black.withOpacity(0.2),
                  //                     spreadRadius: 0.1,
                  //                     blurRadius: 10,
                  //                     offset: Offset(0.5, 0.5)),
                  //               ],
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       itemCount: staticData.length),
                  // ),
                  // //

                  //
                ]),
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
        width: 40.w,

        //width: 50.w,
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

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       _tabController = new TabController(vsync: this, length: 2);
//       _tabController.addListener(_handleTabSelection);
//     });
//   }

//   void _handleTabSelection() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(children: [
//       SizedBox(
//         height: double.infinity,
//         width: double.infinity,
//         child: SvgPicture.asset(
//           Asset.bg,
//           fit: BoxFit.cover,
//         ),
//       ),
//       SafeArea(
//           minimum: EdgeInsets.only(top: 2.h),
//           child: Container(
//               margin: EdgeInsets.only(
//                 top: 1.h,
//               ),
//               child: Center(
//                   child: Column(children: [
//                 HomeAppBar(
//                   title: 'Notifications',
//                   leading: Asset.backbutton,
//                   isfilter: false,
//                   icon: Asset.filter,
//                   isBack: true,
//                   onClick: () {},
//                 ),
//                 Container(
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: <Widget>[
//                         SizedBox(height: 25.0),
//                         DefaultTabController(
//                             length: 2, // length of tabs
//                             initialIndex: 0,
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: <Widget>[
//                                   TabBar(
//                                     controller: _tabController,
//                                     indicatorColor: Colors.transparent,
//                                     unselectedLabelColor: Colors.white,
//                                     labelColor: Colors.amber,
//                                     tabs: [
//                                       Tab(
//                                         child: Container(
//                                           height: 6.h,
//                                           width: 20.h,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(25),
//                                               border: Border.all(width: 1),
//                                               color: Colors.black),
//                                           child: Center(
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 Text(
//                                                   'Upcoming',
//                                                   style: TextStyle(
//                                                       fontSize: 16.sp,
//                                                       fontFamily:
//                                                           fontUrbanistBold),
//                                                 ),
//                                                 CircleAvatar(
//                                                   radius: 13,
//                                                   backgroundColor: white,
//                                                   child: Text(
//                                                     '6',
//                                                     style: TextStyle(
//                                                         fontSize: 16.sp,
//                                                         fontFamily:
//                                                             fontUrbanistBold,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Tab(
//                                           child: Container(
//                                         height: 6.h,
//                                         width: 20.h,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(25),
//                                             border: Border.all(width: 1),
//                                             color: Colors.black),
//                                         child: Center(
//                                           child: Text('Previous',
//                                               style: TextStyle(
//                                                   fontSize: 16.sp,
//                                                   fontFamily:
//                                                       fontUrbanistBold)),
//                                         ),
//                                       )),
//                                     ],
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(
//                                         bottom: 0.5.h, top: 3.h, left: 2.6.h),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'March 22,2023',
//                                           style: TextStyle(
//                                               fontFamily: fontUrbanistBlack,
//                                               fontSize: 16.5.sp),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 580,
//                                     child: TabBarView(children: <Widget>[
// ListView.builder(
//     shrinkWrap: false,
//     itemBuilder: (context, index) {
//       ProductItem data =
//           staticData[index];
//       return Container(
//         margin: EdgeInsets.only(
//             top: 3.h,
//             left: 5.w,
//             right: 5.w),
//         child: Container(
//           padding: EdgeInsets.only(
//               top: 2.h,
//               left: 5.w,
//               right: 5.w,
//               bottom: 2.h),
//           child: Row(
//             mainAxisAlignment:
//                 MainAxisAlignment.start,
//             crossAxisAlignment:
//                 CrossAxisAlignment.start,
//             children: [
//               CircleAvatar(
//                 radius: 18.sp,
//                 backgroundColor:
//                     Colors.white,
//                 child: SvgPicture.asset(
//                   Asset.profileimg,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(width: 2.h),
//               Column(
//                 mainAxisAlignment:
//                     MainAxisAlignment
//                         .spaceEvenly,
//                 crossAxisAlignment:
//                     CrossAxisAlignment
//                         .start,
//                 children: [
//                   Row(
//                     mainAxisAlignment:
//                         MainAxisAlignment
//                             .spaceEvenly,
//                     children: [
//                       Container(
//                         child: Text(
//                           data.Name,
//                           style: TextStyle(
//                               fontFamily:
//                                   fontUrbanistBlack,
//                               fontSize:
//                                   14.sp),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 50.sp,
//                       ),
//                       Text(
//                         data.Status,
//                         style: TextStyle(
//                             color: data.Status ==
//                                     "Completed"
//                                 ? Colors
//                                     .green
//                                 : data.Status ==
//                                         'Pending'
//                                     ? Colors
//                                         .orange
//                                     : Colors
//                                         .red,
//                             fontFamily:
//                                 fontUrbanistRegular,
//                             fontSize: 12),
//                       ),
//                     ],
//                   ),
//                   Container(
//                       child: Text(
//                     data.title,
//                     style: TextStyle(
//                         fontFamily:
//                             fontUrbanistRegular,
//                         fontSize:
//                             11.5.sp),
//                   )),
//                   Text(
//                     data.time,
//                     style: TextStyle(
//                       fontFamily:
//                           fontUrbanistRegular,
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius:
//                 BorderRadius.all(
//                     Radius.circular(10)),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black
//                       .withOpacity(0.2),
//                   spreadRadius: 0.1,
//                   blurRadius: 10,
//                   offset:
//                       Offset(0.5, 0.5)),
//             ],
//           ),
//         ),
//       );
//     },
//     itemCount: staticData.length),
//                                       Container(
//                                         child: ListView.builder(
//                                             shrinkWrap: true,
//                                             itemBuilder: (context, index) {
//                                               ProductItem data =
//                                                   staticData[index];
//                                               return Container(
//                                                 margin: EdgeInsets.only(
//                                                     top: 3.h,
//                                                     left: 5.w,
//                                                     right: 5.w),
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.center,
//                                                   children: [
//                                                     Container(
//                                                       padding: EdgeInsets.only(
//                                                           top: 2.h,
//                                                           left: 5.w,
//                                                           right: 5.w,
//                                                           bottom: 2.h),
//                                                       child: Column(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceEvenly,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Container(
//                                                               child: Text(
//                                                             data.title,
//                                                             style: TextStyle(
//                                                                 fontFamily:
//                                                                     fontUrbanistBold,
//                                                                 fontSize: 15),
//                                                           )),
//                                                           Row(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceBetween,
//                                                             children: [
//                                                               Text(
//                                                                 data.time,
//                                                                 style:
//                                                                     TextStyle(
//                                                                   fontFamily:
//                                                                       fontUrbanistRegular,
//                                                                 ),
//                                                               ),
//                                                               Text(
//                                                                 data.Status,
//                                                                 style: TextStyle(
//                                                                     color: data.Status == "Completed"
//                                                                         ? Colors.green
//                                                                         : data.Status == 'Pending'
//                                                                             ? Colors.orange
//                                                                             : Colors.red,
//                                                                     fontFamily: fontUrbanistRegular,
//                                                                     fontSize: 12),
//                                                               ),
//                                                             ],
//                                                           )
//                                                         ],
//                                                       ),
//                                                       decoration: BoxDecoration(
//                                                         color: Colors.white,
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                                 Radius.circular(
//                                                                     10)),
//                                                         boxShadow: [
//                                                           BoxShadow(
//                                                               color: Colors
//                                                                   .black
//                                                                   .withOpacity(
//                                                                       0.2),
//                                                               spreadRadius: 0.1,
//                                                               blurRadius: 10,
//                                                               offset: Offset(
//                                                                   0.5, 0.5)),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               );
//                                             },
//                                             itemCount: staticData.length),
//                                       ),
//                                     ]),
//                                   )
//                                 ])),
//                       ]),
//                 ),
//               ]))))
//     ]));
//   }
// }

// ListView.builder(
//     shrinkWrap: true,
//     itemBuilder: (context, index) {
//       ProductItem data = staticData[index];
//       return Container(
//         margin: EdgeInsets.only(
//             top: 4.h, left: 5.w, right: 5.w),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               padding: EdgeInsets.only(
//                   top: 2.h,
//                   left: 5.w,
//                   right: 5.w,
//                   bottom: 2.h),
//               child: Column(
//                 mainAxisAlignment:
//                     MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment:
//                     CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                       child: Text(
//                     data.title,
//                     style: TextStyle(
//                         fontFamily: fontUrbanistBold,
//                         fontSize: 15),
//                   )),
//                   Row(
//                     mainAxisAlignment:
//                         MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         data.time,
//                         style: TextStyle(
//                           fontFamily:
//                               fontUrbanistRegular,
//                         ),
//                       ),
//                       Text(
//                         data.Status,
//                         style: TextStyle(
//                             color: data.Status ==
//                                     "Completed"
//                                 ? Colors.green
//                                 : data.Status ==
//                                         'Pending'
//                                     ? Colors.orange
//                                     : Colors.red,
//                             fontFamily:
//                                 fontUrbanistRegular,
//                             fontSize: 12),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(
//                     Radius.circular(10)),
//                 boxShadow: [
//                   BoxShadow(
//                       color:
//                           Colors.black.withOpacity(0.2),
//                       spreadRadius: 0.1,
//                       blurRadius: 10,
//                       offset: Offset(0.5, 0.5)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//     itemCount: staticData.length),

// Container(
//   margin: EdgeInsets.only(top: 16.h),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Container(
//         width: 37.h,
//         height: 8.5.h,
//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: 12,
//             top: 1,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                   padding: EdgeInsets.only(top: 3, right: 8),
//                   child: Text(
//                     'Hair Treatment',
//                     style: TextStyle(
//                         fontFamily: fontUrbanistBold,
//                         fontSize: 15),
//                   )),
//               Container(
//                 padding: EdgeInsets.only(
//                   bottom: 1,
//                   right: 8,
//                 ),
//                 child: Row(
//                   mainAxisAlignment:
//                       MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '11:48 PM',
//                       style: TextStyle(
//                         fontFamily: fontUrbanistRegular,
//                       ),
//                     ),
//                     Text(
//                       'Completed',
//                       style: TextStyle(
//                           color: Colors.green,
//                           fontFamily: fontUrbanistRegular,
//                           fontSize: 12),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 spreadRadius: 0.1,
//                 blurRadius: 10,
//                 offset: Offset(0.5, 0.5)),
//           ],
//         ),
//       ),
//     ],
//   ),
// ),
// SizedBox(
//   height: 3.5.h,
// ),
// Column(
//   mainAxisAlignment: MainAxisAlignment.start,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Container(
//       width: 37.h,
//       height: 8.5.h,
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 12,
//           top: 3,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//                 padding: EdgeInsets.only(top: 3, right: 8),
//                 child: Text(
//                   'Hair Cutting / Hair Smoothing',
//                   style: TextStyle(
//                       fontFamily: fontUrbanistBold, fontSize: 15),
//                 )),
//             Container(
//               padding: EdgeInsets.only(bottom: 1, right: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     '11:48 PM',
//                     style: TextStyle(
//                         fontFamily: fontUrbanistRegular),
//                   ),
//                   Text(
//                     'Pending',
//                     style: TextStyle(
//                         color: Colors.orange,
//                         fontFamily: fontUrbanistRegular,
//                         fontSize: 12),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               spreadRadius: 0.1,
//               blurRadius: 10,
//               offset: Offset(0.5, 0.5)),
//         ],
//       ),
//     ),
//   ],
// ),
// SizedBox(height: 3.5.h),
// Column(
//   mainAxisAlignment: MainAxisAlignment.start,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Container(
//       width: 37.h,
//       height: 8.5.h,
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 12,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//                 padding: EdgeInsets.only(top: 3, right: 8),
//                 child: Text(
//                   'Hair Spa / Hair Treatment',
//                   style: TextStyle(
//                       fontFamily: fontUrbanistBold, fontSize: 15),
//                 )),
//             Container(
//               padding: EdgeInsets.only(bottom: 1, right: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     '11:48 PM',
//                     style: TextStyle(
//                         fontFamily: fontUrbanistRegular),
//                   ),
//                   Text(
//                     'Cancelled',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontFamily: fontUrbanistRegular,
//                         fontSize: 12),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               spreadRadius: 0.1,
//               blurRadius: 10,
//               offset: Offset(0.5, 0.5)),
//         ],
//       ),
//     ),
//   ],
// ),
