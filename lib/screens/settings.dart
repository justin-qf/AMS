import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/constants/assets.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
