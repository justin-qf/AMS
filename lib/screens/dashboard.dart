import 'package:animate_do/animate_do.dart';
import 'package:booking_app/screens/homepage.dart';
import 'package:booking_app/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Appointment.dart';
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static late GlobalKey<ScaffoldState> key;
  var currentPage = 0;

  @override
  void initState() {
    key = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navdrawer(),
      key: key,
      body: Center(
        child: _buildScreens.elementAt(currentPage),
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: FadeInUp(
            from: 50,
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 5,
              curve: Curves.bounceInOut,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              duration: Duration(milliseconds: 400),
              tabBorderRadius: 10,
              tabBackgroundColor: Colors.black,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.assignment_add,
                  text: 'Appointment',
                ),
                GButton(
                  icon: Icons.supervised_user_circle,
                  text: 'Profile',
                ),
              ],
              selectedIndex: currentPage,
              onTabChange: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
        ),
      ),
      // bottomNavigationBar: PersistentTabView(
      //   context,
      //   controller: _controller,
      //   screens: _buildScreens(),
      //   items: _navBarsItems(),
      //   bottomScreenMargin: 0,
      //   confineInSafeArea: true,
      //   backgroundColor: Colors.white, // Default is Colors.white.
      //   handleAndroidBackButtonPress: true, // Default is true.
      //   resizeToAvoidBottomInset:
      //       true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      //   stateManagement: true, // Default is true.
      //   hideNavigationBarWhenKeyboardShows:
      //       true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      //   decoration: NavBarDecoration(
      //     boxShadow: [
      //       BoxShadow(
      //           color: Colors.black.withOpacity(0.2),
      //           spreadRadius: 0.1,
      //           blurRadius: 10,
      //           offset: Offset(0.5, 0.5)),
      //     ],
      //     borderRadius: BorderRadius.circular(17),
      //     colorBehindNavBar: Colors.white,
      //   ),
      //   popAllScreensOnTapOfSelectedTab: true,
      //   popActionScreens: PopActionScreensType.once,

      //   margin: EdgeInsets.only(left: 18, right: 18, bottom: 20),
      //   padding: NavBarPadding.only(left: 3.0.w, right: 1.0.w),

      //   itemAnimationProperties: const ItemAnimationProperties(
      //     // Navigation Bar's items animation properties.
      //     duration: Duration(milliseconds: 200),
      //     curve: Curves.ease,
      //   ),
      //   screenTransitionAnimation: const ScreenTransitionAnimation(
      //     // Screen transition animation on change of selected tab.
      //     animateTabTransition: true,

      //     curve: Curves.ease,
      //     duration: Duration(milliseconds: 50),
      //   ),
      //   navBarStyle: NavBarStyle.style9,
      //   navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
      //       ? 1.5
      //       : kBottomNavigationBarHeight, // Choose the nav bar style with this property.
      //   //               ),
      // ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [

  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         Asset.home,
  //         color: Colors.grey,
  //       ),
  //       title: ("Home"),
  //       textStyle: TextStyle(fontFamily: fontUrbanistMedium),
  //       activeColorPrimary: Colors.black.withAlpha(200),

  //       inactiveColorPrimary: Colors.white,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         Asset.calender,
  //         color: Colors.grey,
  //       ),
  //       title: ("Calender"),
  //       textStyle: TextStyle(fontFamily: fontUrbanistMedium),
  //       activeColorPrimary: Colors.black,
  //       inactiveColorPrimary: Colors.blue,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         Asset.add_service_offer,
  //         color: Colors.grey,
  //       ),
  //       title: ("Settings"),
  //       textStyle: TextStyle(fontFamily: fontUrbanistMedium),
  //       activeColorPrimary: Colors.black,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         Asset.megaphone,
  //         color: Colors.grey,
  //       ),
  //       title: ("Notification"),
  //       textStyle: TextStyle(fontFamily: fontUrbanistMedium),
  //       activeColorPrimary: Colors.black,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         Asset.user,
  //         color: Colors.grey,
  //       ),
  //       title: ("Profile"),
  //       textStyle: TextStyle(fontFamily: fontUrbanistMedium),
  //       activeColorPrimary: Colors.black,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }

  // List<Widget> _buildScreens() {
  //   return [
  //     home(
  //       openDrawer: _key,
  //     ),
  //     Calender(),
  //     Settings(),
  //     notificationpage(),
  //     profile(),
  //   ];
  // }

  static final List<Widget> _buildScreens = <Widget>[
    home(
      openDrawer: key,
    ),
    Appointment(),
    profile(),
  ];
}
