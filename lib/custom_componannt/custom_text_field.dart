import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../../core/themes/color_const.dart';
import '../core/themes/font_constant.dart';
import '../core/themes/style.dart';
import 'form_inputs.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {Key? key,
      required this.hintText,
      required this.errorText,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      required this.inputType,
      required this.node,
      this.controller,
      this.formType,
      this.isExpand,
      this.isVerified,
      this.wantSuffix,
      this.onVerifiyButtonClick,
      this.isDataValidated,
      this.onTap,
      this.isFromAddStory = false,
      this.isEnable = true})
      : super(key: key);
  final TextEditingController? controller;
  final String hintText;
  final FieldType? formType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final FocusNode node;
  final Function(String?)? onChanged;
  final bool? isExpand;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final bool? isVerified;
  final Function? onVerifiyButtonClick;
  final bool? wantSuffix;
  final bool? isDataValidated;
  final Function? onTap;
  bool isEnable = true;
  bool isFromAddStory = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnable,
      cursorColor: primaryColor,
      onTap: () {
        if (onTap != null) onTap!();
      },
      textInputAction: TextInputAction.next,
      keyboardType: inputType,
      validator: validator,
      controller: controller,
      maxLength: inputType == TextInputType.number ? 16 : null,
      style: isFromAddStory
          ? TextStyle(
              fontFamily: fontRegular,
              fontSize:
                  SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 8.sp,
              color: black)
          : styleTextFormFieldText(),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        labelStyle: styleTextForFieldLabel(node),
        contentPadding: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            top: SizerUtil.deviceType == DeviceType.mobile
                ? isExpand!
                    ? 10.h
                    : 0.w
                : 3.w,
            bottom: SizerUtil.deviceType == DeviceType.mobile ? 0.w : 3.w),
        //EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 5.w),
        hintText: hintText,
        errorText: errorText,
        hintStyle: styleTextForFieldHint(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: inputBorderColor,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: inputBorderColor, width: 1.2),
          borderRadius: BorderRadius.circular(30),
        ),
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: inputBorderColor,
          ),
        ),
        // prefixStyle: styleTextFormFieldText(),
        prefixIcon: formType != null && formType == FieldType.Mobile
            ? Container(
                padding: const EdgeInsets.only(left: 16, bottom: 3, right: 3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("+91", style: styleTextFormFieldText()),
                  ],
                ),
              )
            : null,
        prefixIconConstraints:
            const BoxConstraints(minHeight: 25, maxHeight: 30),
        suffix: (wantSuffix != null &&
                wantSuffix! &&
                controller!.text.toString().isNotEmpty &&
                errorText == null)
            ? GestureDetector(
                onTap: () {
                  onVerifiyButtonClick!();
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 3, right: 5, left: 5, bottom: 3),
                  decoration: BoxDecoration(
                      color: isVerified! ? Colors.green : primaryColor,
                      borderRadius: BorderRadius.circular(3)),
                  child: Text(
                    isVerified! ? 'Verified' : 'Verify',
                    style: TextStyle(
                        fontSize: 7.sp,
                        fontFamily: fontMedium,
                        color: Colors.white),
                  ),
                ),
              )
            : Container(
                width: 1,
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
    );
  }
}
