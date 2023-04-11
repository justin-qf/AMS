import 'package:booking_app/core/constants/assets.dart';
import 'package:booking_app/core/themes/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class Navdrawer extends StatelessWidget {
  const Navdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(23),
                  bottomRight: Radius.circular(23)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(23),
                bottomRight: Radius.circular(23),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [Theme.of(context).primaryColor, Color(0xff995DFF)],
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Drawer(
                  width: MediaQuery.of(context).size.width * 0.8,
                  shadowColor: Colors.white,
                  elevation: 0,
                  backgroundColor: Colors.black,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildHeader(context),
                        SizedBox(
                          height: 1.h,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 2.h,
                          thickness: 1,
                        ),
                        buildMenuItems(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: 5.5.h, left: 3.2.h, bottom: 2.h),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                Asset.profileimg,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 2.5.w),
            Container(
              margin: EdgeInsets.only(bottom: 1.5.h, top: 1.8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Yuvraj Babariya",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontFamily: fontUrbanistBold),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    '+91 1234567890',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                        fontFamily: fontUrbanistMedium),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  buildMenuItems(BuildContext context) => Container(
      color: Colors.black,
      padding: EdgeInsets.only(left: 2.2.h, top: 1.5.h, bottom: 1.h),
      child: Wrap(
        children: [
          ListTile(
            hoverColor: Colors.white,
            horizontalTitleGap: 0.1,
            leading: SvgPicture.asset(
              Asset.user,
              height: 3.h,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: fontUrbanistRegular,
                  fontSize: 11.5.sp),
            ),
            onTap: () {},
          ),
          ListTile(
            // leading: Icon(
            //   Icons.add_sharp,
            //   color: Colors.white,
            // ),
            leading: SvgPicture.asset(
              Asset.add_service,
            ),
            horizontalTitleGap: 0.1,

            title: Text(
              'Add Services',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: fontUrbanistRegular,
                  fontSize: 11.5.sp),
            ),
            onTap: () {},
          ),
          ListTile(
            // leading: Icon(
            //   Icons.add_box,
            //   color: Colors.white,
            // ),
            leading: SvgPicture.asset(
              Asset.adduser,
            ),
            horizontalTitleGap: 0.1,
            title: Text('Add Expert',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: fontUrbanistRegular,
                    fontSize: 11.5.sp)),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              Asset.add_service_offer,
            ),
            horizontalTitleGap: 0.1,
            title: Text('Add Service Offer',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: fontUrbanistRegular,
                    fontSize: 11.5.sp)),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              Asset.passwordlock,
            ),
            horizontalTitleGap: 0.1,
            title: Text('Change Password',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: fontUrbanistRegular,
                    fontSize: 11.5.sp)),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              Asset.settingslider,
            ),
            horizontalTitleGap: 0.1,
            title: Text('Setting',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: fontUrbanistRegular,
                    fontSize: 11.5.sp)),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              Asset.rate_us,
            ),
            horizontalTitleGap: 0.1,
            title: Text('Rate Us',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: fontUrbanistRegular,
                    fontSize: 11.5.sp)),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              Asset.share,
            ),
            horizontalTitleGap: 0.1,
            title: Text('Share Us',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: fontUrbanistRegular,
                    fontSize: 11.5.sp)),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              Asset.signout,
            ),
            horizontalTitleGap: 0.1,
            title: Text('Sign Out',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: fontUrbanistRegular,
                    fontSize: 11.5.sp)),
            onTap: () {},
          ),
          SizedBox(height: 11.5.h),
          ListTile(
            leading: SvgPicture.asset(
              Asset.info_help,
            ),
            horizontalTitleGap: 0.1,
            title: Text('Help',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: fontUrbanistRegular,
                    fontSize: 11.5.sp)),
            onTap: () {},
          ),
        ],
      ));
}
