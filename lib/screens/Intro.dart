import 'package:booking_app/core/themes/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../core/constants/assets.dart';
import 'login.dart';
import 'onboarding-content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF000000),
      ),
      margin: const EdgeInsets.only(
        right: 5,
      ),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
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
              Expanded(
                flex: 2,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemCount: contents.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            contents[i].image,
                            // height: SizeConfig.blockV! * 30,
                            height: i == 1 ? 25.h : 35.h,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          // Text(
                          //   contents[i].title,
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     fontFamily: "Mulish",
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: (width <= 550) ? 25 : 15,
                          //   ),
                          // ),
                          // const SizedBox(height: 15),
                          // Text(
                          //   contents[i].desc,
                          //   style: TextStyle(
                          //     fontFamily: "Mulish",
                          //     fontWeight: FontWeight.w300,
                          //     fontSize: (width <= 550) ? 17 : 25,
                          //   ),
                          //   textAlign: TextAlign.center,
                          // )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (int index) => _buildDots(
                          index: index,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Expanded(
                          child: Text(
                              'Lorem ipsum dolor sit amet consectetur.\nId sed purus malesuada euismod.',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: fontUrbanistMedium),
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                    _currentPage + 1 == contents.length
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: 8.h, left: 11.5.w, right: 11.5.w),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Loginpage()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all(15),
                                textStyle: TextStyle(
                                    fontSize:
                                        (double.infinity <= 550) ? 13 : 17),
                              ),
                              child: Center(
                                  child: Text(
                                "Let's Get Started",
                                style: TextStyle(
                                    fontFamily: fontUrbanistBold,
                                    fontSize: 16.5.sp,
                                    fontWeight: FontWeight.w700),
                              )),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const CircleBorder(
                                        side: BorderSide(width: 11)),
                                    elevation: 0,
                                    // padding: (width <= 550)
                                    //     ? const EdgeInsets.symmetric(
                                    //         horizontal: 5, vertical: 5)
                                    //     : const EdgeInsets.symmetric(
                                    //         horizontal: 30, vertical: 25),
                                    textStyle: TextStyle(
                                        fontSize:
                                            (double.infinity <= 550) ? 13 : 17),
                                  ),
                                  child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 50),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
