import 'package:booking_app/core/themes/font_constant.dart';
import 'package:booking_app/screens/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../constants/assets.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar(
      {super.key,
      this.openDrawer,
      required this.title,
      required this.isfilter,
      required this.icon});
  GlobalKey<ScaffoldState>? openDrawer;
  final String title;
  bool isfilter;
  String icon = Asset.filter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 20, top: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () => openDrawer!.currentState!.openDrawer(),
            borderRadius: BorderRadius.all(Radius.circular(24)),
            // <-- Opens drawer
            // child: Icon(
            //   Icons.arrow_back_rounded,
            //   size: 30,
            //   color: Colors.black,
            // ),
            child: SvgPicture.asset(Asset.menu),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 1, left: 9, right: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 17.5,
                      color: Colors.black,
                      fontFamily: fontUrbanistBlack,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => notification()));
              },
              // onTap: () =>
              // openDrawer.currentState!.openDrawer(),

              borderRadius: BorderRadius.all(Radius.circular(24)),
              child: SvgPicture.asset(
                Asset.notification,
              ),
            ),
          ),
          SizedBox(
            width: 6.5.w,
          ),
          Visibility(
            visible: isfilter,
            child: Container(
              padding: EdgeInsets.only(right: 1.h),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => notification()));
                },
                borderRadius: BorderRadius.all(Radius.circular(24)),
                child: SvgPicture.asset(Asset.cart),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
