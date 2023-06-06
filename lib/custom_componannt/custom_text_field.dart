import 'package:booking_app/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
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
      this.title,
      this.inputFormatters,
      required this.inputType,
      required this.node,
      this.controller,
      this.formType,
      this.isExpand,
      this.isVerified,
      this.isStarting,
      this.isPhoto,
      this.isDropdown,
      this.isCalender,
      this.isHidden,
      this.wantSuffix,
      this.onVerifiyButtonClick,
      this.isDataValidated,
      this.onTap,
      this.isPick,
      this.isPassword,
      this.isFromAddStory = false,
      this.isEnable = true})
      : super(key: key);
  final TextEditingController? controller;
  final String hintText;
  final FieldType? formType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final String? title;
  final FocusNode node;
  final Function(String?)? onChanged;
  final bool? isExpand;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final bool? isVerified;
  final bool? isPick;
  final bool? isStarting;
  final bool? isDropdown;
  final bool? isPhoto;
  final bool? isPassword;
  final bool? isCalender;
  final Function? onVerifiyButtonClick;
  final bool? wantSuffix;
  final bool? isHidden;
  final bool? isDataValidated;
  final Function? onTap;
  bool isEnable = true;
  bool isFromAddStory = false;
  bool obscuretext = false;
  @override
  Widget build(BuildContext context) {
    print(
      "wantSuffix${wantSuffix}",
    );
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
      obscureText: obscuretext,
      obscuringCharacter: '*',
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
        suffixIcon: wantSuffix == true
            ? GestureDetector(
                onTap: () {
                  obscuretext = !obscuretext;
                  print('Hidden');
                  // onVerifiyButtonClick!();
                },
                child: isStarting == true
                    ? SvgPicture.asset(Asset.time,
                        height: 5, width: 5, fit: BoxFit.scaleDown)
                    : isDropdown == true
                        ? SvgPicture.asset(
                            Asset.dropdown,
                            height: 5,
                            width: 5,
                            fit: BoxFit.scaleDown,
                          )
                        : isCalender == true
                            ? SvgPicture.asset(
                                Asset.calender,
                                height: 5,
                                width: 5,
                                fit: BoxFit.scaleDown,
                                color: Colors.grey,
                              )
                            : InkWell(
                                child: isPassword == true
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                        size: 20.sp,
                                      )
                                    :
                                    // : Icon(
                                    //     Icons.photo,
                                    //     size: 25,
                                    //   ))
                                    SvgPicture.asset(Asset.photos,
                                        height: 5,
                                        width: 5,
                                        fit: BoxFit.scaleDown),
                              ))
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
