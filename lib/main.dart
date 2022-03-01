import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:simpe/screens/splash/splash_screen.dart';

import 'app/translations/trans.dart';
import 'screens/splash/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Simpe',
      getPages: [
        GetPage(name: '/', page: () => SplashscreenWidget()),
        GetPage(name: '/onBoarding', page: () => OnBoardingScreen()),
      ],

      translations: Messages(), // your translations
      locale:
          Locale('en', 'US'), // translations will be displayed in that locale
      fallbackLocale: Locale('en', 'UK'), // specify the fallback loca

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/onBoarding",
    );
  }
}
