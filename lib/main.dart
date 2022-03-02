import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:simpe/screens/splash/splash_screen.dart';

import 'app/routs/app_routes.dart';
import 'app/translations/trans.dart';

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
      defaultTransition: Transition.fadeIn,

      getPages: Routes.allRoutes,

      translations: Messages(), // your translations
      locale: const Locale(
          'en', 'US'), // translations will be displayed in that locale
      fallbackLocale: const Locale('en', 'UK'), // specify the fallback loca

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.splash,
    );
  }
}
