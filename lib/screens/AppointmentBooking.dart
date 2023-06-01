import 'package:animate_do/animate_do.dart';
import 'package:booking_app/screens/signup2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/addproduct_controller.dart';
import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/constants/strings.dart';
import '../core/themes/font_constant.dart';
import '../custom_componannt/common_views.dart';
import '../custom_componannt/form_inputs.dart';

class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({super.key});

  @override
  State<AppointmentBookingScreen> createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  final Product = Get.put(ProductController());
  bool check1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          minimum: EdgeInsets.only(top: 1.h),
          child: Stack(children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SvgPicture.asset(
                Asset.bg,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Center(
                child: Column(children: [
              HomeAppBar(
                title: Strings.add_product,
                leading: Asset.backbutton,
                isfilter: false,
                icon: Asset.filter,
                isBack: true,
                onClick: () {
                  Get.back();
                },
              ),
            ])),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 6.h, left: 1.0.w, right: 1.0.w),
                padding: EdgeInsets.only(
                    left: 7.0.w, right: 7.0.w, top: 2.h, bottom: 1.h),
                child: Form(
                    key: Product.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getTitle(Strings.customer),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Product.NameNode,
                                    controller: Product.NameCtr,
                                    hintLabel: Strings.customer_hint,
                                    onChanged: (val) {
                                      Product.validatename(val);
                                    },
                                    errorText: Product.NameModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.Services),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Product.productimgNode,
                                    controller: Product.productimgCtr,
                                    hintLabel: Strings.Services,
                                    onChanged: (val) {
                                      Product.validateProductimg(val);
                                      setState(() {});
                                    },
                                    errorText:
                                        Product.productimgModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.Appointment_slot),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Product.productimgNode,
                                    controller: Product.productimgCtr,
                                    hintLabel: Strings.Services,
                                    onChanged: (val) {
                                      Product.validateProductimg(val);
                                      setState(() {});
                                    },
                                    errorText:
                                        Product.productimgModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.amount),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Product.descriptionNode,
                                    controller: Product.descriptionCtr,
                                    hintLabel: Strings.amount_hint,
                                    onChanged: (val) {
                                      Product.validateAmount(val);
                                      setState(() {});
                                    },
                                    errorText:
                                        Product.descriptionModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.notes),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Product.descriptionNode,
                                    controller: Product.descriptionCtr,
                                    hintLabel: Strings.notes_hint,
                                    onChanged: (val) {
                                      Product.validateQuantity(val);
                                      setState(() {});
                                    },
                                    isExpand: true,
                                    errorText:
                                        Product.descriptionModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        Theme(
                          data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.black,
                            visualDensity:
                                VisualDensity(horizontal: -2, vertical: -4),
                            contentPadding:
                                EdgeInsets.only(top: 0.5, bottom: 0.5),
                            value: check1,
                            onChanged: (bool? value) {
                              print(value);
                              setState(() {
                                check1 = value!;
                              });
                            },
                            title: Text(
                              'Remind Customer ?',
                              style: TextStyle(
                                  fontFamily: opensansMedium,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5.h),
                            width: double.infinity,
                            height: 6.h,
                            child: getButton(() {
                              if (Product.isFormInvalidate.value) {
                                Get.to(Signup2());
                              }
                            })),
                      ],
                    )),
              ),
            ),
          ]),
        ));
  }
}
