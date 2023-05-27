import 'package:animate_do/animate_do.dart';
import 'package:booking_app/screens/signup2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/sign_in_controller.dart';
import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/constants/strings.dart';
import '../custom_componannt/common_views.dart';
import '../custom_componannt/form_inputs.dart';

class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  TextEditingController _vendorname = TextEditingController();
  TextEditingController _companyname = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _personname = TextEditingController();
  TextEditingController _contact1 = TextEditingController();
  TextEditingController _contact2 = TextEditingController();
  TextEditingController _whatsapp = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final signinController = Get.put(SignInController());

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
                title: Strings.add_vendor,
                leading: Asset.backbutton,
                isfilter: false,
                icon: Asset.filter,
                isBack: true,
                onClick: () {
                  Get.back();
                },
              ),
            ])),
            Container(
              margin: EdgeInsets.only(top: 6.h, left: 1.0.w, right: 1.0.w),
              padding: EdgeInsets.only(
                  left: 7.0.w, right: 7.0.w, top: 2.h, bottom: 1.h),
              child: Form(
                  key: _formKey,
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
                                  node: signinController.vendorNameNode,
                                  controller: signinController.vendorNameCtr,
                                  hintLabel: 'Enter Name',
                                  onChanged: (val) {
                                    signinController.validateVendorname(val);
                                    setState(() {});
                                  },
                                  errorText: signinController
                                      .vendorNameModel.value.error,
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
                                  node: signinController.companyNameNode,
                                  controller: signinController.companyNameCtr,
                                  hintLabel: Strings.enter_company_name,
                                  onChanged: (val) {
                                    signinController.validateCompanyname(val);
                                    setState(() {});
                                  },
                                  errorText: signinController
                                      .companyNameModel.value.error,
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
                                  node: signinController.addressNode,
                                  controller: signinController.addressCtr,
                                  hintLabel: Strings.company_address_hint,
                                  onChanged: (val) {
                                    signinController.validateAddressname(val);
                                    setState(() {});
                                  },
                                  errorText:
                                      signinController.addressModel.value.error,
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
                                  node: signinController.emailNode,
                                  controller: signinController.emailCtr,
                                  hintLabel: Strings.emailId_hint,
                                  onChanged: (val) {
                                    signinController.validateEmail(val);
                                    setState(() {});
                                  },
                                  errorText:
                                      signinController.emailModel.value.error,
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
                                  node: signinController.contactNode,
                                  controller: signinController.contactCtr,
                                  formType: FieldType.Mobile,
                                  hintLabel: Strings.contact_no_hint,
                                  onChanged: (val) {
                                    signinController.validatePhone(val);
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
                                  errorText: signinController
                                      .mobileNoModel.value.error,
                                  wantSuffix: true,
                                  inputType: TextInputType.number,
                                );
                              }))),
                      Container(
                          margin: EdgeInsets.only(top: 5.h),
                          width: double.infinity,
                          height: 6.h,
                          child: getButton(() {
                            if (signinController.isFormInvalidate.value) {
                              Get.to(Signup2());
                            }
                          })),
                    ],
                  )),
            ),
          ]),
        ));
  }
}
