import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/AppointmentBooking_controller.dart';
import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/constants/strings.dart';
import '../core/themes/font_constant.dart';
import '../custom_componannt/common_views.dart';
import '../custom_componannt/form_inputs.dart';
import 'TimeSlot.dart';

class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({super.key});

  @override
  State<AppointmentBookingScreen> createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  final Booking = Get.put(AppointmentBookingController());
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
                title: Strings.appointment_booking,
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
                    key: Booking.formKey,
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
                                    node: Booking.CustomerNode,
                                    controller: Booking.Customerctr,
                                    hintLabel: Strings.customer_hint,
                                    wantSuffix: true,
                                    isDropdown: true,
                                    onChanged: (val) {
                                      Booking.validateCustomer(val);
                                    },
                                    errorText:
                                        Booking.CustomerModel.value.error,
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
                                    node: Booking.ServiceNode,
                                    controller: Booking.Servicectr,
                                    hintLabel: Strings.Services,
                                    wantSuffix: true,
                                    isDropdown: true,
                                    onChanged: (val) {
                                      Booking.validateService(val);
                                      setState(() {});
                                    },
                                    errorText: Booking.ServiceModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.Appointment_slot),
                        SizedBox(
                          height: 1.h,
                        ),
                        GridView.count(
                            shrinkWrap: true,
                            childAspectRatio: 1.5,
                            crossAxisCount: 3,
                            crossAxisSpacing: 16.2,
                            mainAxisSpacing: -0.0,
                            children: List.generate(choices.length, (index) {
                              return Container(
                                child: SelectCard(
                                    choice: choices[index], index: index),
                              );
                            })),
                        // Column(
                        //   children: [
                        //     Obx(
                        //       () {
                        //         return Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Container(
                        //               child: getTime(Strings.time1, Booking),
                        //             ),
                        //             Container(
                        //               child: getTime(Strings.time2, Booking),
                        //             ),
                        //             Container(
                        //               child: getTime(Strings.time3, Booking),
                        //             ),
                        //           ],
                        //         );
                        //       },
                        //     ),
                        //     SizedBox(
                        //       height: 1.h,
                        //     ),
                        //     // Obx(
                        //     //   () {
                        //     //     return Row(
                        //     //       mainAxisAlignment:
                        //     //           MainAxisAlignment.spaceBetween,
                        //     //       children: [
                        //     //         Container(
                        //     //           child: getTime(Strings.time4,
                        //     //                Booking),
                        //     //         ),
                        //     //         Container(
                        //     //           child: getTime(Strings.time5,
                        //     //                Booking),
                        //     //         ),
                        //     //         Container(
                        //     //           child: getTime(Strings.time6,
                        //     //                Booking),
                        //     //         ),
                        //     //       ],
                        //     //     );
                        //     //   },
                        //     // ),
                        //     SizedBox(
                        //       height: 1.h,
                        //     ),
                        //     // Row(
                        //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     //   children: [
                        //     //     Container(
                        //     //       child: getTime(Strings.time7,
                        //     //           Booking.isClickd.value, Booking),
                        //     //     ),
                        //     //     Container(
                        //     //       child: getTime(Strings.time8,
                        //     //           Booking.isClickd.value, Booking),
                        //     //     ),
                        //     //     Container(
                        //     //       child: getTime(Strings.time9,
                        //     //           Booking.isClickd.value, Booking),
                        //     //     ),
                        //     //   ],
                        //     // ),
                        //     SizedBox(
                        //       height: 1.h,
                        //     ),
                        //     // Row(
                        //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     //   children: [
                        //     //     Container(
                        //     //       child: getTime(Strings.time10,
                        //     //           Booking.isClickd.value, Booking),
                        //     //     ),
                        //     //     Container(
                        //     //       child: getTime(Strings.time11,
                        //     //           Booking.isClickd.value, Booking),
                        //     //     ),
                        //     //     Container(
                        //     //       child: getTime(Strings.time12,
                        //     //           Booking.isClickd.value, Booking),
                        //     //     ),
                        //     //   ],
                        //     // ),
                        //   ],
                        // ),
                        SizedBox(height: 2.h),
                        getTitle(Strings.amount),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Booking.AmountNode,
                                    controller: Booking.Amountctr,
                                    hintLabel: Strings.amount_hint,
                                    onChanged: (val) {
                                      Booking.validateAmount(val);
                                      setState(() {});
                                    },
                                    errorText: Booking.AmountModel.value.error,
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
                                    node: Booking.NoteNode,
                                    controller: Booking.Notectr,
                                    hintLabel: Strings.notes_hint,
                                    onChanged: (val) {
                                      Booking.validateNote(val);
                                      setState(() {});
                                    },
                                    isExpand: true,
                                    errorText: Booking.NoteModel.value.error,
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
                              if (Booking.isFormInvalidate.value) {
                                // Get.to(Signup2());
                              }
                            })),
                        SizedBox(
                          height: 2.h,
                        )
                      ],
                    )),
              ),
            ),
          ]),
        ));
  }
}
