import 'package:booking_app/controllers/AppointmentBooking_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../core/themes/font_constant.dart';

class Choice {
  Choice({required this.title, required this.isSelected});
  final String title;
  bool isSelected;
}

List<Choice> choices = <Choice>[
  Choice(
    title: '10:30 AM',
    isSelected: false,
  ),
  Choice(
    title: '11:30 AM',
    isSelected: false,
  ),
  Choice(
    title: '12:30 PM',
    isSelected: false,
  ),
  Choice(
    title: '01:30 PM',
    isSelected: false,
  ),
  Choice(title: '02:30 PM', isSelected: false),
  Choice(title: '04:00 PM', isSelected: false),
  Choice(title: '05:00 PM', isSelected: false),
  Choice(title: '06:00 PM', isSelected: false),
  Choice(title: '07:00 PM', isSelected: false),
  Choice(title: '08:00 PM', isSelected: false),
  Choice(title: '09:00 PM', isSelected: false),
  Choice(title: '10:00 PM', isSelected: false),
];

final controler = AppointmentBookingController();

class SelectCard extends StatefulWidget {
  SelectCard({
    Key? key,
    required this.choice,
    required this.index,
  }) : super(key: key);
  final Choice choice;
  final int index;

  @override
  State<SelectCard> createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            widget.choice.isSelected = !widget.choice.isSelected;
            setState(() {});
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 5.h,
            width: 25.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: widget.choice.isSelected ? Colors.black : Colors.grey,
            ),
            child: Center(
              child: Text(
                widget.choice.title,
                style: TextStyle(
                    fontFamily: opensans_Bold,
                    color: Colors.white,
                    fontSize: SizerUtil.deviceType == DeviceType.mobile
                        ? 12.sp
                        : 13.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
      ],
    );
  }
}
