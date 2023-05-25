import 'package:booking_app/core/themes/font_constant.dart';
import 'package:booking_app/screens/profile.dart';
import 'package:booking_app/screens/referal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../Models/setting.dart';
import '../Models/settings_model.dart';
import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<SettingItem> staticData = SettingsItems;
  get index => null;

  bool state = false;

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
          minimum: EdgeInsets.only(top: 2.h),
          child: Container(
              margin: EdgeInsets.only(
                top: 1.h,
              ),
              child: Center(
                  child: Column(children: [
                HomeAppBar(
                  title: 'Settings',
                  leading: Asset.backbutton,
                  isfilter: false,
                  icon: Asset.filter,
                  isBack: true,
                  onClick: () {},
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 2.h),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        // horizontalTitleGap: 0.1,
                        // leading: data.icon,
                        // title: Container(
                        //     // margin: EdgeInsets.only(right: 1.h),
                        //     child: Text(
                        //   data.Name,
                        //   style: TextStyle(
                        //       fontFamily: fontUrbanistRegular,
                        //       fontWeight: FontWeight.w400,
                        //       fontSize: 15.sp),
                        // )),
                        // trailing:
                        //     data.button != null ? data.button : null),
                        leading: SvgPicture.asset(
                          Asset.user,
                          color: Colors.black,
                        ),
                        horizontalTitleGap: 0.1,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        title: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => profile()));
                          },
                          child: Text(
                            'Profile Information',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => profile()));
                            },
                            icon: SvgPicture.asset(Asset.rightbackbutton)),
                      ),
                      Divider(
                        height: 1.5,
                        thickness: 1,
                        indent: 2.h,
                        endIndent: 4.h,
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          Asset.adduser,
                          color: Colors.black,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        horizontalTitleGap: 0.1,
                        title: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => referal()));
                          },
                          child: Text(
                            'Invite Friends',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => referal()));
                            },
                            icon: SvgPicture.asset(Asset.rightbackbutton)),
                        // trailing: TextButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => referal()));
                        //     },
                        //     child: SvgPicture.asset(Asset.rightbackbutton)),
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        indent: 2.h,
                        endIndent: 4.h,
                      ),
                      ListTile(
                          leading: SvgPicture.asset(Asset.moon),
                          horizontalTitleGap: 0.1,
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -1),
                          title: Text(
                            'Change Theme',
                            style: TextStyle(
                                fontFamily: opensansMedium,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Container(
                            padding: EdgeInsets.only(right: 1.5.h),
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
                          )),
                      Divider(
                        height: 1.5,
                        thickness: 1,
                        indent: 2.h,
                        endIndent: 4.h,
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          Asset.rate_us,
                          color: Colors.black,
                        ),
                        horizontalTitleGap: 0.1,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        title: Text(
                          'Rate Us',
                          style: TextStyle(
                              fontFamily: opensansMedium,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Divider(
                        height: 1.5,
                        thickness: 1,
                        indent: 2.h,
                        endIndent: 4.h,
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          Asset.share,
                          color: Colors.black,
                        ),
                        horizontalTitleGap: 0.1,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        title: Text(
                          'Share Us',
                          style: TextStyle(
                              fontFamily: opensansMedium,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Divider(
                        height: 1.5,
                        thickness: 1,
                        indent: 2.h,
                        endIndent: 4.h,
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          Asset.signout,
                          color: Colors.black,
                        ),
                        horizontalTitleGap: 0.1,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        title: Text(
                          'Log Out',
                          style: TextStyle(
                              fontFamily: opensansMedium,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ]))))
    ]));
  }
}
