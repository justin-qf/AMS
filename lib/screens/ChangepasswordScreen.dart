import 'package:animate_do/animate_do.dart';
import 'package:booking_app/Screens/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/ChangePassword_controller.dart';
import '../core/constants/assets.dart';
import '../core/constants/strings.dart';
import '../core/themes/font_constant.dart';
import '../custom_componannt/common_views.dart';
import '../custom_componannt/form_inputs.dart';

class ChangepasswordScreen extends StatefulWidget {
  const ChangepasswordScreen({super.key});

  @override
  State<ChangepasswordScreen> createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  final Controller = Get.put(ChangePasswordController());
  bool _isHidden = true;
  bool _isHidden1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SvgPicture.asset(Asset.bg, fit: BoxFit.cover),
          ),
          SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Container(
                  margin: EdgeInsets.only(
                    right: 8.h,
                  ),
                  padding: EdgeInsets.only(
                    top: 8.h,
                  ),
                  child: Text(
                    Strings.change_pass,
                    style: TextStyle(
                        fontFamily: opensans_Bold,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 7.0.w,
                          right: 7.0.w,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Asset.changepass,
                                height: 25.h,
                                width: 15.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 7.0.w, right: 7.0.w, top: 3.h, bottom: 3.h),
                        child: Form(
                            key: Controller.formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getTitle(Strings.previous_pass),
                                FadeInUp(
                                    from: 30,
                                    child: AnimatedSize(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: Obx(() {
                                          return getReactiveFormField(
                                            node: Controller.PreNode,
                                            controller: Controller.prectr,
                                            hintLabel: Strings.pass_hint,
                                            wantSuffix: true,
                                            isPassword: true,
                                            onChanged: (val) {
                                              Controller.validatePrePass(val);
                                            },
                                            errorText:
                                                Controller.PreModel.value.error,
                                            inputType: TextInputType.text,
                                          );
                                        }))),
                                getTitle(Strings.new_pass),
                                FadeInUp(
                                    from: 30,
                                    child: AnimatedSize(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: Obx(() {
                                          return getReactiveFormField(
                                            node: Controller.NewNode,
                                            controller: Controller.newctr,
                                            hintLabel: Strings.new_pass,
                                            wantSuffix: true,
                                            isPassword: true,
                                            onChanged: (val) {
                                              Controller.validateNewPass(val);
                                            },
                                            errorText:
                                                Controller.NewModel.value.error,
                                            inputType: TextInputType.text,
                                          );
                                        }))),
                                getTitle(Strings.confirm_new_pass),
                                FadeInUp(
                                    from: 30,
                                    child: AnimatedSize(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: Obx(() {
                                          return getReactiveFormField(
                                            node: Controller.ConfirmNode,
                                            controller: Controller.confirmctr,
                                            hintLabel: Strings.pass_hint,
                                            onChanged: (val) {
                                              Controller.validateConfirmPass(
                                                  val);
                                            },
                                            wantSuffix: true,
                                            isPassword: true,
                                            errorText: Controller
                                                .ConfirmModel.value.error,
                                            inputType: TextInputType.text,
                                          );
                                        }))),
                                SizedBox(height: 1.0.h),
                                // Container(
                                //   height: 5.7.h,
                                //   child: TextField(
                                //     obscureText: _isHidden,
                                //     obscuringCharacter: '*',
                                //     decoration: InputDecoration(
                                //         hintText: Strings.enter_new_pass,
                                //         hintStyle: TextStyle(fontSize: 12.sp),
                                //         contentPadding: EdgeInsets.only(
                                //             top: 1.h, left: 3.h, bottom: 1.h),
                                //         focusedBorder: OutlineInputBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(30),
                                //         ),
                                //         enabledBorder: OutlineInputBorder(
                                //             borderRadius:
                                //                 BorderRadius.circular(30)),
                                //         suffixIcon: InkWell(
                                //           onTap: _togglePasswordView,
                                //           child: Icon(
                                //             _isHidden
                                //                 ? Icons.visibility_off
                                //                 : Icons.visibility,
                                //             color: Colors.grey,
                                //             size: 20.sp,
                                //           ),
                                //         )),
                                //     keyboardType: TextInputType.name,
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 1.5.h,
                                // ),
                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   // ignore: prefer_const_literals_to_create_immutables
                                //   children: [
                                //     Text(
                                //       Strings.confirm_new_pass,
                                //       style: TextStyle(
                                //           fontFamily: opensans_Bold,
                                //           fontWeight: FontWeight.w700,
                                //           fontSize: 14.sp),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 1.0.h),
                                // Container(
                                //   height: 5.7.h,
                                //   child: TextField(
                                //     obscureText: _isHidden1,
                                //     obscuringCharacter: '*',
                                //     decoration: InputDecoration(
                                //         hintText: Strings.confirm_new_pass,
                                //         contentPadding: EdgeInsets.only(
                                //             top: 1.h, left: 3.h, bottom: 1.h),
                                //         hintStyle: TextStyle(fontSize: 12.sp),
                                //         focusedBorder: OutlineInputBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(30),
                                //         ),
                                //         enabledBorder: OutlineInputBorder(
                                //             borderRadius:
                                //                 BorderRadius.circular(30)),
                                //         suffixIcon: InkWell(
                                //           onTap: _togglePasswordView1,
                                //           child: Icon(
                                //             _isHidden1
                                //                 ? Icons.visibility_off
                                //                 : Icons.visibility,
                                //             color: Colors.grey,
                                //             size: 20.sp,
                                //           ),
                                //         )),
                                //     keyboardType: TextInputType.name,
                                //   ),
                                // ),

                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                    width: 100.w,
                                    height: 6.h,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50))),
                                        child: Text(
                                          Strings.submit,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.5.sp,
                                              fontFamily: opensans_Bold,
                                              fontWeight: FontWeight.w700),
                                        ))),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ]))
        ]));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _togglePasswordView1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }
}
