import 'package:animate_do/animate_do.dart';
import 'package:booking_app/controllers/addproduct_controller.dart';
import 'package:booking_app/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../core/Common/appbar.dart';
import '../core/Common/toolbar.dart';
import '../core/constants/assets.dart';
import '../core/constants/strings.dart';
import '../custom_componannt/common_views.dart';
import '../custom_componannt/form_inputs.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final Product = Get.put(ProductController());

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
              getToolbar("Add Product", showBackButton: true, callback: () {
                Get.back();
              })
              // HomeAppBar(
              //   title: Strings.add_product,
              //   leading: Asset.backbutton,
              //   isfilter: false,
              //   icon: Asset.filter,
              //   isBack: true,
              //   onClick: () {
              //     Get.back();
              //   },
              // ),
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
                        getTitle(Strings.Name),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Product.NameNode,
                                    controller: Product.NameCtr,
                                    hintLabel: Strings.name_hint,
                                    onChanged: (val) {
                                      Product.validatename(val);
                                    },
                                    errorText: Product.NameModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.product_img),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Product.productimgNode,
                                    controller: Product.productimgCtr,
                                    hintLabel: Strings.product_img_hint,
                                    wantSuffix: true,
                                    onChanged: (val) {
                                      Product.validatename(val);
                                      setState(() {});
                                    },
                                    errorText:
                                        Product.productimgModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.description),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Product.descriptionNode,
                                    controller: Product.descriptionCtr,
                                    hintLabel: Strings.description_hint,
                                    onChanged: (val) {
                                      Product.validateDescription(val);
                                      setState(() {});
                                    },
                                    isExpand: true,
                                    errorText:
                                        Product.descriptionModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.category),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Product.categoryNode,
                                    controller: Product.categroryCtr,
                                    hintLabel: Strings.category_hint,
                                    wantSuffix: true,
                                    isDropdown: true,
                                    onChanged: (val) {
                                      Product.validateCategory(val);
                                      setState(() {});
                                    },
                                    errorText:
                                        Product.categroryModel.value.error,
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
                                    node: Product.amountNode,
                                    controller: Product.amountCtr,
                                    hintLabel: Strings.amount_hint,
                                    onChanged: (val) {
                                      Product.validateAmount(val);
                                      setState(() {});
                                    },
                                    errorText: Product.amountModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        getTitle(Strings.quantity),
                        FadeInUp(
                            from: 30,
                            child: AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Obx(() {
                                  return getReactiveFormField(
                                    node: Product.quantitynode,
                                    controller: Product.quantityCtr,
                                    hintLabel: Strings.quantity_hint,
                                    onChanged: (val) {
                                      Product.validateQuantity(val);
                                      setState(() {});
                                    },
                                    errorText:
                                        Product.quantityModel.value.error,
                                    inputType: TextInputType.text,
                                  );
                                }))),
                        Container(
                            margin: EdgeInsets.only(top: 5.h),
                            width: double.infinity,
                            height: 6.h,
                            child: getButton(() {
                              if (Product.isFormInvalidate.value) {
                                // Get.to(Signup2());
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
