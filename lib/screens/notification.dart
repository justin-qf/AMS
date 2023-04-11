import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';

class notification extends StatelessWidget {
  notification({super.key});

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
          SafeArea(
              minimum: EdgeInsets.only(top: 2.h),
              child: Container(
                  margin: EdgeInsets.only(
                    top: 5.5.h,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        HomeAppBar(
                          title: 'Notifications',
                          isfilter: true,
                          icon: Asset.filter,
                        ),
                      ],
                    ),
                  ))),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 37.h,
                    height: 8.5.h,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 3,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 2, right: 8),
                              child: Text('Hello')),
                          Text('World'),
                          Container(
                            padding: EdgeInsets.only(bottom: 2, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Completed'),
                              ],
                            ),
                          )
                        ],
                      ),
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
