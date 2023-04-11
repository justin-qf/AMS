import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/constants/assets.dart';

class notificationpage extends StatefulWidget {
  const notificationpage({super.key});

  @override
  State<notificationpage> createState() => _notificationpageState();
}

class _notificationpageState extends State<notificationpage> {
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
