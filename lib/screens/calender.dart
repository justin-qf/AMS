import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/constants/assets.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SvgPicture.asset(
          Asset.bg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
