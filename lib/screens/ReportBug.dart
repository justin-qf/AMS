import 'package:animate_do/animate_do.dart';
import 'package:booking_app/screens/signup2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../controllers/ReportBug_controller.dart';
import '../controllers/addproduct_controller.dart';
import '../core/Common/appbar.dart';
import '../core/constants/assets.dart';
import '../core/constants/strings.dart';
import '../custom_componannt/common_views.dart';
import '../custom_componannt/form_inputs.dart';

class ReportBug extends StatefulWidget {
  const ReportBug({super.key});

  @override
  State<ReportBug> createState() => _ReportBugState();
}

class _ReportBugState extends State<ReportBug> {
  final ReportBug = Get.put(ReportBugController());

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
                    key: ReportBug.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getTitle(Strings.selectvendor),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: ReportBug.SelectvendorNode,
                                    controller: ReportBug.selectvendorctr,
                                    hintLabel: Strings.vendor_hint,
                                    onChanged: (val) {
                                      ReportBug.validateFieldname(val);
                                    },
                                    errorText:
                                        ReportBug.SelectvendorModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.upload),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: ReportBug.ImageNode,
                                    controller: ReportBug.imgctr,
                                    hintLabel: Strings.upload_hint,
                                    onChanged: (val) {
                                      ReportBug.validateImage(val);
                                      setState(() {});
                                    },
                                    errorText: ReportBug.ImageModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.upload_videoo),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: ReportBug.VideoNode,
                                    controller: ReportBug.videoctr,
                                    hintLabel: Strings.upload_video_hint,
                                    onChanged: (val) {
                                      ReportBug.validateVideo(val);
                                      setState(() {});
                                    },
                                    errorText: ReportBug.VideoModel.value.error,
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
                                    node: ReportBug.NoteNode,
                                    controller: ReportBug.notesctr,
                                    hintLabel: Strings.notes_hint,
                                    onChanged: (val) {
                                      ReportBug.validateNotes(val);
                                      setState(() {});
                                    },
                                    isExpand: true,
                                    errorText: ReportBug.NoteModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        Container(
                            margin: EdgeInsets.only(top: 5.h),
                            width: double.infinity,
                            height: 6.h,
                            child: getButton(() {
                              if (ReportBug.isFormInvalidate.value) {
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
