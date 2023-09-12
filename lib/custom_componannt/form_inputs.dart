import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'custom_text_field.dart';

enum FieldType { Email, Mobile, Text, DropDownl }

Widget getReactiveFormField(
    {required node,
    required controller,
    required hintLabel,
    required void Function(String? val) onChanged,
    String? errorText,
    List<TextInputFormatter>? inputFormatters,
    required TextInputType inputType,
    FieldType? formType,
    Function? onVerifyButtonClick,
    bool? isVerified,
    bool? wantSuffix,
    bool? isStarting,
    bool? isPhoto,
    bool? isDropdown,
    bool? isDataValidated,
    bool? isCalender,
    bool? isPassword,
    Function? onTap,
    bool isExpand = false,
    String? fromObsecureText,
    bool isFromAddStory = false,
    bool isFromIntro = false,
    final String? index,
    bool isEnable = true}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 1.2.h),
    child: CustomFormField(
        hintText: hintLabel,
        errorText: errorText,
        node: node,
        isExpand: isExpand,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        inputType: inputType,
        formType: formType,
        controller: controller,
        onVerifiyButtonClick: onVerifyButtonClick,
        isVerified: isVerified,
        isStarting: isStarting,
        isDropdown: isDropdown,
        isCalender: isCalender,
        wantSuffix: wantSuffix,
        isPassword: isPassword,
        onTap: onTap,
        index: index,
        fromObsecureText: fromObsecureText,
        isFromAddStory: isFromAddStory,
        isEnable: isEnable),
  );
}
