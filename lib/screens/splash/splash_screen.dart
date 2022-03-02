import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simpe/screens/splash/splashscreenController.dart';

class SplashscreenWidget extends GetView<SplashScreenController> {
  @override
  final controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator SplashscreenWidget - FRAME

    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: const Size(375, 812),
      context: context,
      minTextAdapt: true,
    );

    return Scaffold(
        body: Stack(children: [
      Center(
          child: SizedBox.expand(
        child: Image.asset(
          "assets/icons/splashscreenBack.png",
          fit: BoxFit.fitWidth,
        ),
      )),
      Center(child: Image.asset("assets/icons/Simpe.png")),
    ]));
  }
}
