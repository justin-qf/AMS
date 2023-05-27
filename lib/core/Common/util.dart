import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget getDivider() {
  return Container(
    height: 0.5.h,
    width: 22.w,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.black),
  );
}

void hideKeyboard(context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

void log(tag, data) {
  print("$tag : ${data}");
}
