import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  var titles = ["Instant", "Simple", "Less fees"];

  var descs = [
    "Transactions are confirmed instantly in Simpe",
    "Making transfers the easy way. QR code, links and more.",
    "Exchanges and transfers with the LOWEST rates on the market. And how we do it is amazing."
  ];

  PageController controllerPage = PageController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
