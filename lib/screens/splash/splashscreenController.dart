import 'dart:async';
import 'package:get/get.dart';
import 'package:simpe/app/routs/app_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(Duration(seconds: 3), () => Get.offNamed(Routes.onboarding));
  }
}
