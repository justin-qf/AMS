import 'package:animate_do/animate_do.dart';
import 'package:booking_app/Screens/LoginScreen/LoginScreen.dart';
import 'package:booking_app/controllers/addcustomer_controller.dart';
import 'package:booking_app/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/constants/strings.dart';
import '../custom_componannt/common_views.dart';
import '../custom_componannt/form_inputs.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final AddCustomerController = Get.put(AddcustomerController());

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
            SizedBox(
              height: 0.5.h,
            ),
            Center(
                child: Column(children: [
              HomeAppBar(
                title: Strings.add_customer,
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
                    key: AddCustomerController.formKey,
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
                                    node: AddCustomerController.CustomerNode,
                                    controller:
                                        AddCustomerController.Customerctr,
                                    hintLabel: Strings.enter_name,
                                    onChanged: (val) {
                                      AddCustomerController
                                          .validateCustomerName(val);
                                    },
                                    errorText: AddCustomerController
                                        .customerModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.profile_photo),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: AddCustomerController.ProfileNode,
                                    controller:
                                        AddCustomerController.Profilectr,
                                    hintLabel: Strings.profile_photo_hint,
                                    wantSuffix: true,
                                    onChanged: (val) {
                                      AddCustomerController.validateProfile(
                                          val);
                                      setState(() {});
                                    },
                                    errorText: AddCustomerController
                                        .profileModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.dob),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: AddCustomerController.DobNode,
                                    controller: AddCustomerController.Dobctr,
                                    hintLabel: Strings.dob_hint,
                                    wantSuffix: true,
                                    isCalender: true,
                                    onChanged: (val) {
                                      AddCustomerController.validateDob(val);
                                      setState(() {});
                                    },
                                    errorText: AddCustomerController
                                        .dobModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.doa),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: AddCustomerController.DoaNode,
                                    controller: AddCustomerController.Doactr,
                                    hintLabel: Strings.dob_hint,
                                    wantSuffix: true,
                                    isCalender: true,
                                    onChanged: (val) {
                                      AddCustomerController.validateDoa(val);
                                      setState(() {});
                                    },
                                    errorText: AddCustomerController
                                        .doaModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.address),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: AddCustomerController.AddressNode,
                                    controller:
                                        AddCustomerController.Addressctr,
                                    hintLabel: Strings.enteraddress,
                                    onChanged: (val) {
                                      AddCustomerController.validateAddree(val);
                                      setState(() {});
                                    },
                                    isExpand: true,
                                    errorText: AddCustomerController
                                        .addressModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.contact_no_one),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: AddCustomerController.Contact1Node,
                                    controller:
                                        AddCustomerController.Contact1ctr,
                                    hintLabel: Strings.contact_no_hint,
                                    onChanged: (val) {
                                      AddCustomerController.validateContact1(
                                          val);
                                      setState(() {});
                                    },
                                    errorText: AddCustomerController
                                        .contact1Model.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.contact_no_two),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: AddCustomerController.Contact2Node,
                                    controller:
                                        AddCustomerController.Contact2ctr,
                                    hintLabel: Strings.contact_no_hint,
                                    onChanged: (val) {
                                      AddCustomerController.validateContact2(
                                          val);
                                      setState(() {});
                                    },
                                    errorText: AddCustomerController
                                        .contact2Model.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.whatsapp_no),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: AddCustomerController.WhatsappNode,
                                    controller:
                                        AddCustomerController.Whatsappctr,
                                    hintLabel: Strings.whatsapp_hint,
                                    onChanged: (val) {
                                      AddCustomerController.validateWhatsapp(
                                          val);
                                      setState(() {});
                                    },
                                    errorText: AddCustomerController
                                        .whatsappModel.value.error,
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
                                    node: AddCustomerController.EmailNode,
                                    controller: AddCustomerController.Emailctr,
                                    hintLabel: Strings.emailId_hint,
                                    onChanged: (val) {
                                      AddCustomerController.validateEmail(val);
                                      setState(() {});
                                    },
                                    errorText: AddCustomerController
                                        .emailModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        Container(
                            margin: EdgeInsets.only(top: 5.h),
                            width: double.infinity,
                            height: 6.h,
                            child: getButton(() {
                              Get.to(LoginScreen());
                            })),
                      ],
                    )),
              ),
            ),
          ]),
        ));
  }
}
