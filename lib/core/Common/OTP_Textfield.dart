import 'package:booking_app/core/themes/color_const.dart';
import 'package:booking_app/core/themes/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OtpInput extends StatefulWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final FocusNode node;

  const OtpInput(this.controller, this.autoFocus, this.node, {Key? key})
      : super(key: key);

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  @override
  Widget build(BuildContext context) {
    widget.node.addListener(() {
      setState(() {});
      setState(() {});
    });
    widget.controller.addListener(() {
      setState(() {});
    });

    return SizedBox(
      height: SizerUtil.deviceType == DeviceType.mobile ? 15.w : 10.w,
      width: SizerUtil.deviceType == DeviceType.mobile ? 15.w : 10.w,
      child: TextFormField(
        cursorColor: Colors.black,
        controller: widget.controller,
        autofocus: widget.autoFocus,
        cursorWidth: 0.8,
        cursorHeight: SizerUtil.deviceType == DeviceType.mobile ? 30 : 30,
        maxLength: 1,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.trim().length == 1) {
            setState(() {});
            FocusScope.of(context).nextFocus();
          }
        },
        style: TextStyle(
            fontFamily: fontUrbanistExtraBold,
            fontSize: SizerUtil.deviceType == DeviceType.mobile ? 22.sp : 16.sp,
            color: black),
        decoration: InputDecoration(
          fillColor: widget.controller.text.toString().isNotEmpty
              ? secondaryColor
              : Graycolor,
          filled: widget.controller.text.toString().isNotEmpty ? true : false,
          counterText: '',
          contentPadding: EdgeInsets.only(
              top: SizerUtil.deviceType == DeviceType.mobile ? 1.2.h : 2.h,
              bottom: 2.h),
          hintStyle: const TextStyle(
            fontFamily: fontRegular,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                SizerUtil.deviceType == DeviceType.mobile ? 5.w : 2.5.w),
            borderSide: BorderSide(
              color: widget.controller.text.toString().isEmpty
                  ? black
                  : secondaryColor,
              width: 0.4.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                SizerUtil.deviceType == DeviceType.mobile ? 5.w : 2.5.w),
            borderSide: BorderSide(
              color: black,
              width: 0.4.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                SizerUtil.deviceType == DeviceType.mobile ? 5.w : 2.5.w),
            borderSide: BorderSide(
              color: black,
              width: 0.4.w,
            ),
          ),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
