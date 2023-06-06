import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:booking_app/core/Common/Common.dart';
import 'package:booking_app/screens/Splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'controllers/internet_controller.dart';
import 'controllers/theme_controller.dart';
import 'core/constants/get_storage_key.dart';
import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final intenetController = Get.put(InternetController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<InternetController>(() => InternetController());
    Get.lazyPut<ThemeController>(() => ThemeController());
    final getStorage = GetStorage();
    int isDarkMode = getStorage.read(GetStorageKey.IS_DARK_MODE) ?? 1;
    getStorage.write(GetStorageKey.IS_DARK_MODE, isDarkMode);
    Common().trasparent_statusbar();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ThemeProvider(
            initTheme:
                isDarkMode == 1 ? AppTheme.lightTheme : AppTheme.darkTheme,
            child: Builder(builder: (context) {
              return GetBuilder<ThemeController>(
                  init: ThemeController(),
                  builder: (ctr) {
                    return GetMaterialApp(
                      title: Strings.title,
                      theme: !ctr.isDark.value
                          ? ThemeData.light()
                          : ThemeData.dark(),
                      https://github.com/Esra2-Abdelltif/sala-App.git: false,
                      home: Splashscreen(),
                      defaultTransition: Transition.rightToLeftWithFade,
                    );
                  });
            }
                // MaterialApp(
                //   title: Strings.title,
                //   debugShowCheckedModeBanner: false,
                //   theme: ThemeData(
                //     primarySwatch: Colors.blue,
                //   ),
                //   builder: (context, child) {
                //     return MediaQuery(
                //       child: child!,
                //       data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                //     );
                //   },
                //   home: Splashscreen(),
                // ),
                ));
      },
    );
  }
}
