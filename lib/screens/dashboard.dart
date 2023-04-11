import 'package:booking_app/core/themes/font_constant.dart';
import 'package:booking_app/screens/calender.dart';
import 'package:booking_app/screens/homepage.dart';
import 'package:booking_app/screens/bottomNotification.dart';
import 'package:booking_app/screens/profile.dart';
import 'package:booking_app/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import '../core/constants/assets.dart';
import 'navdrawer.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PersistentTabController _controller;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(),
      key: _key,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        bottomScreenMargin: 0,
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0.1,
                blurRadius: 10,
                offset: Offset(0.5, 0.5)),
          ],
          borderRadius: BorderRadius.circular(17),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.once,

        margin: EdgeInsets.only(left: 18, right: 18, bottom: 20),
        padding: NavBarPadding.only(left: 3.0.w, right: 1.0.w),

        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,

          curve: Curves.ease,
          duration: Duration(milliseconds: 50),
        ),
        navBarStyle: NavBarStyle.style9,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 1.5
            : kBottomNavigationBarHeight, // Choose the nav bar style with this property.
        //               ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        
        icon: SvgPicture.asset(
          Asset.home,
          color: Colors.grey,
        ),
        title: ("Home"),
        textStyle: TextStyle(fontFamily: fontUrbanistMedium),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Asset.calender,
          color: Colors.grey,
        ),
        title: ("Calender"),
        textStyle: TextStyle(fontFamily: fontUrbanistMedium),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.blue,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Asset.add_service_offer,
          color: Colors.grey,
        ),
        title: ("Settings"),
        textStyle: TextStyle(fontFamily: fontUrbanistMedium),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Asset.megaphone,
          color: Colors.grey,
        ),
        title: ("Notification"),
        textStyle: TextStyle(fontFamily: fontUrbanistMedium),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Asset.user,
          color: Colors.grey,
        ),
        title: ("Profile"),
        textStyle: TextStyle(fontFamily: fontUrbanistMedium),
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      home(
        openDrawer: _key,
      ),
      Calender(),
      Settings(),
      notificationpage(),
      profile(),
    ];
  }
}
