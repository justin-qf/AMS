import 'package:animate_do/animate_do.dart';
import 'package:booking_app/Screens/LoginScreen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/AddVendor_controller.dart';
import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/constants/strings.dart';
import '../custom_componannt/common_views.dart';
import '../custom_componannt/form_inputs.dart';

class AddVendorScreen extends StatefulWidget {
  const AddVendorScreen({super.key});

  @override
  State<AddVendorScreen> createState() => _AddVendorScreenState();
}

class _AddVendorScreenState extends State<AddVendorScreen> {
  final Controller = Get.put(AddVendorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        // body: Stack(children: [
        //   SizedBox(
        //     height: double.infinity,
        //     width: double.infinity,
        //     child: SvgPicture.asset(
        //       Asset.bg,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        //   SafeArea(
        //       minimum: EdgeInsets.only(top: 1.h),
        //       child: Container(
        //           margin: EdgeInsets.only(
        //             top: 0.5.h,
        //           ),
        //           child: Center(
        //               child: Column(children: [
        //             HomeAppBar(
        //               title: 'Add Vendor',
        //               leading: Asset.backbutton,
        //               isfilter: false,
        //               icon: Asset.filter,
        //               isBack: true,
        //               onClick: () {},
        //             ),
        //           ])))),
        //   Container(
        //       margin: EdgeInsets.only(top: 7.h, left: 1.0.w, right: 1.0.w),
        //       padding: EdgeInsets.only(
        //           left: 7.0.w, right: 7.0.w, top: 4.h, bottom: 1.h),
        //       child: Form(
        //           key: _formKey,
        //           child: Container(
        //               child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       'Vendor Name',
        //                       style: TextStyle(
        //                           fontFamily: opensans_Bold,
        //                           fontSize: 12.sp,
        //                           fontWeight: FontWeight.w700),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 0.5.h,
        //                 ),
        //                 Container(
        //                   height: 5.5.h,
        //                   child: TextField(
        //                     decoration: InputDecoration(
        //                       hintText: 'Enter Name',
        //                       contentPadding: EdgeInsets.only(
        //                           top: 1.h, left: 2.h, bottom: 1.h),
        //                       focusedBorder: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(30),
        //                       ),
        //                       enabledBorder: OutlineInputBorder(
        //                           borderRadius: BorderRadius.circular(30)),
        //                     ),
        //                     controller: _vendor,
        //                     keyboardType: TextInputType.name,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 2.h,
        //                 ),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   // ignore: prefer_const_literals_to_create_immutables
        //                   children: [
        //                     Text(
        //                       'Company Name',
        //                       style: TextStyle(
        //                           fontFamily: opensans_Bold,
        //                           fontWeight: FontWeight.w700,
        //                           fontSize: 12.sp),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 0.5.h,
        //                 ),
        //                 Container(
        //                   height: 5.5.h,
        //                   child: TextField(
        //                     decoration: InputDecoration(
        //                       hintText: 'Enter Company Name',
        //                       contentPadding: EdgeInsets.only(
        //                           top: 1.h, left: 2.h, bottom: 1.h),
        //                       focusedBorder: OutlineInputBorder(
        //                         borderRadius: BorderRadius.circular(30),
        //                       ),
        //                       enabledBorder: OutlineInputBorder(
        //                           borderRadius: BorderRadius.circular(30)),
        //                     ),
        //                     controller: _company,
        //                     keyboardType: TextInputType.name,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 2.h,
        //                 ),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   // ignore: prefer_const_literals_to_create_immutables
        //                   children: [
        //                     Text(
        //                       'Company Address',
        //                       style: TextStyle(
        //                           fontFamily: opensans_Bold,
        //                           fontWeight: FontWeight.w700,
        //                           fontSize: 12.sp),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 0.5.h,
        //                 ),
        //                 Container(
        //                   height: 5.5.h,
        //                   child: TextField(
        //                     decoration: InputDecoration(
        //                         hintText: 'Enter Company Address',
        //                         contentPadding: EdgeInsets.only(
        //                             top: 1.h, left: 2.h, bottom: 1.h),
        //                         focusedBorder: OutlineInputBorder(
        //                           borderRadius: BorderRadius.circular(30),
        //                         ),
        //                         enabledBorder: OutlineInputBorder(
        //                             borderRadius: BorderRadius.circular(30)),
        //                         suffixIcon: Icon(Icons.photo)),
        //                     controller: _address,
        //                     keyboardType: TextInputType.name,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 2.h,
        //                 ),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   // ignore: prefer_const_literals_to_create_immutables
        //                   children: [
        //                     Text(
        //                       'Email Id',
        //                       style: TextStyle(
        //                           fontFamily: opensans_Bold,
        //                           fontWeight: FontWeight.w700,
        //                           fontSize: 12.sp),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 0.5.h,
        //                 ),
        //                 Container(
        //                   height: 5.5.h,
        //                   child: TextField(
        //                     decoration: InputDecoration(
        //                         hintText: 'Enter Email Id',
        //                         contentPadding: EdgeInsets.only(
        //                             top: 1.h, left: 2.h, bottom: 1.h),
        //                         focusedBorder: OutlineInputBorder(
        //                           borderRadius: BorderRadius.circular(30),
        //                         ),
        //                         enabledBorder: OutlineInputBorder(
        //                             borderRadius: BorderRadius.circular(30)),
        //                         suffixIcon: Icon(Icons.photo)),
        //                     controller: _email,
        //                     keyboardType: TextInputType.name,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 2.h,
        //                 ),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   // ignore: prefer_const_literals_to_create_immutables
        //                   children: [
        //                     Text(
        //                       'Contact No.',
        //                       style: TextStyle(
        //                           fontFamily: opensans_Bold,
        //                           fontWeight: FontWeight.w700,
        //                           fontSize: 12.sp),
        //                     ),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 0.5.h,
        //                 ),
        //                 Container(
        //                   height: 5.5.h,
        //                   child: TextField(
        //                     decoration: InputDecoration(
        //                         hintText: 'Enter Contact No',
        //                         contentPadding: EdgeInsets.only(
        //                             top: 1.h, left: 2.h, bottom: 1.h),
        //                         focusedBorder: OutlineInputBorder(
        //                           borderRadius: BorderRadius.circular(30),
        //                         ),
        //                         enabledBorder: OutlineInputBorder(
        //                             borderRadius: BorderRadius.circular(30)),
        //                         suffixIcon: Icon(Icons.photo)),
        //                     controller: _email,
        //                     keyboardType: TextInputType.name,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 7.h,
        //                 ),
        //                 SizedBox(
        //                     width: 150.h,
        //                     height: 6.h,
        //                     child: ElevatedButton(
        //                         onPressed: () {
        //                           // Navigator.push(
        //                           //     context,
        //                           //     MaterialPageRoute(
        //                           //         builder: (context) =>
        //                           //             const Loginpage()));
        //                         },
        //                         style: ElevatedButton.styleFrom(
        //                             backgroundColor: Colors.black,
        //                             shape: RoundedRectangleBorder(
        //                                 borderRadius:
        //                                     BorderRadius.circular(50))),
        //                         child: Text(
        //                           'Submit',
        //                           style: TextStyle(
        //                               color: Colors.white,
        //                               fontSize: 14.5.sp,
        //                               fontFamily: opensans_Bold,
        //                               fontWeight: FontWeight.w700),
        //                         ))),
        //               ]))))
        // ]));
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
                title: Strings.add_vendor,
                leading: Asset.backbutton,
                isfilter: false,
                icon: Asset.filter,
                isBack: true,
                onClick: () {
                  Get.back(result: LoginScreen());
                },
              ),
            ])),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 6.h, left: 1.0.w, right: 1.0.w),
                padding: EdgeInsets.only(
                    left: 7.0.w, right: 7.0.w, top: 2.h, bottom: 1.h),
                child: Form(
                    key: Controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getTitle(Strings.vendor_name),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Controller.VendorNode,
                                    controller: Controller.Vendorctr,
                                    hintLabel: 'Enter Name',
                                    onChanged: (val) {
                                      Controller.validateVendor(val);
                                      setState(() {});
                                    },
                                    errorText:
                                        Controller.VendorModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.company_title),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Controller.CompanyNode,
                                    controller: Controller.Companyctr,
                                    hintLabel: Strings.enter_company_name,
                                    onChanged: (val) {
                                      Controller.validateCompany(val);
                                      setState(() {});
                                    },
                                    errorText:
                                        Controller.CompanyModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.company_address),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Controller.AddressNode,
                                    controller: Controller.Addressctr,
                                    hintLabel: Strings.company_address_hint,
                                    isExpand: true,
                                    onChanged: (val) {
                                      Controller.validateAddress(val);
                                      setState(() {});
                                    },
                                    errorText:
                                        Controller.AddressModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.emailId),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Controller.EmailNode,
                                    controller: Controller.Emailctr,
                                    hintLabel: Strings.emailId_hint,
                                    onChanged: (val) {
                                      Controller.validateEmail(val);
                                      setState(() {});
                                    },
                                    errorText:
                                        Controller.EmailModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.contact_no),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Controller.ContactNode,
                                    controller: Controller.Contactctr,
                                    formType: FieldType.Mobile,
                                    hintLabel: Strings.contact_no_hint,
                                    onChanged: (val) {
                                      Controller.validateContact(val);
                                      setState(() {});
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9,+,' ']")),
                                      // MaskedTextInputFormatter(
                                      //   mask: 'xxxx xxxx xx',
                                      //   separator: ' ',
                                      // ),
                                    ],
                                    errorText:
                                        Controller.ContactModel.value.error,
                                    inputType: TextInputType.number,
                                  );
                                }))),
                        Container(
                            margin: EdgeInsets.only(top: 5.h),
                            width: double.infinity,
                            height: 6.h,
                            child: getButton(() {
                              if (Controller.isFormInvalidate.value) {
                                Get.to(LoginScreen());
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
