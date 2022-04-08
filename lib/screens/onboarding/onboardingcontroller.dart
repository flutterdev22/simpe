import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  var titles = ["Instant".tr, "Simple".tr, "Less fees".tr];

  var descs = [
    "Transactions are confirmed instantly in Simpe".tr,
    "Making transfers the easy way. QR code, links and more.".tr,
    "Exchanges and transfers with the LOWEST rates on the market. And how we do it is amazing.".tr
  ];

  PageController controllerPage = PageController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
