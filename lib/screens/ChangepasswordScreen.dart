import 'package:animate_do/animate_do.dart';
import 'package:booking_app/Screens/LoginScreen/LoginScreen.dart';
import 'package:booking_app/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/ChangePassword_controller.dart';
import '../core/Common/toolbar.dart';
import '../core/constants/assets.dart';
import '../core/constants/strings.dart';
import '../custom_componannt/common_views.dart';
import '../custom_componannt/form_inputs.dart';

class ChangepasswordScreen extends StatefulWidget {
  ChangepasswordScreen({super.key, this.fromProfile});
  bool? fromProfile;

  @override
  State<ChangepasswordScreen> createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  final controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: isDarkMode()
                ? SvgPicture.asset(
                    Asset.dark_bg,
                    fit: BoxFit.cover,
                  )
                : SvgPicture.asset(
                    Asset.bg,
                    fit: BoxFit.cover,
                  ),
          ),
          SingleChildScrollView(
              child: Form(
            key: controller.resetpasskey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 5.h,
                    ),
                    child: getViewProfile("Change Password",
                        showBackButton: true, callback: () {
                      Get.back();
                    }),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.fromProfile == true)
                                getTitle(Strings.previous_pass),
                              widget.fromProfile == true
                                  ? FadeInUp(
                                      from: 30,
                                      child: AnimatedSize(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          child: Obx(() {
                                            return getReactiveFormField(
                                              node: controller.currentpassNode,
                                              controller: controller.currentCtr,
                                              hintLabel: Strings.pass_hint,
                                              wantSuffix: true,
                                              isPassword: true,
                                              onChanged: (val) {
                                                controller
                                                    .validateCurrentPass(val);
                                              },
                                              index: "0",
                                              fromObsecureText: "RESETPASS",
                                              errorText: controller
                                                  .currentPassModel.value.error,
                                              inputType: TextInputType.text,
                                            );
                                          })))
                                  : Container(),
                              getTitle(Strings.new_pass),
                              FadeInUp(
                                  from: 30,
                                  child: AnimatedSize(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: Obx(() {
                                        return getReactiveFormField(
                                          node: controller.newpassNode,
                                          controller: controller.newpassCtr,
                                          hintLabel: Strings.new_pass,
                                          wantSuffix: true,
                                          isPassword: true,
                                          onChanged: (val) {
                                            widget.fromProfile == true
                                                ? controller
                                                    .validateNewPass(val)
                                                : controller
                                                    .validateNewPassword(val);
                                          },
                                          index: "1",
                                          fromObsecureText: "RESETPASS",
                                          errorText: controller
                                              .newPassModel.value.error,
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
                                          node: controller.confirmpassNode,
                                          controller: controller.confirmCtr,
                                          hintLabel: Strings.pass_hint,
                                          onChanged: (val) {
                                            widget.fromProfile == true
                                                ? controller
                                                    .validateConfirmPass(val)
                                                : controller
                                                    .validateForgotPass(val);
                                          },
                                          index: "2",
                                          fromObsecureText: "RESETPASS",
                                          wantSuffix: true,
                                          isPassword: true,
                                          errorText: controller
                                              .confirmPassModel.value.error,
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
                              Container(
                                margin: EdgeInsets.only(
                                  left: 14.w,
                                  right: 14.w,
                                ),
                                child: FadeInUp(
                                  from: 50,
                                  child: Obx(() {
                                    return getFormButton(
                                      () {
                                        if (controller.isFormInvalidate.value ==
                                            true) {
                                          controller.getResetPass(context,
                                              widget.fromProfile == true);
                                          Get.to(LoginScreen());
                                        }
                                      },
                                      "Done",
                                      validate: widget.fromProfile == true
                                          ? controller.isFormInvalidate.value
                                          : controller
                                              .isForgotPasswordValidate.value,
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ))
        ]));
  }
}
