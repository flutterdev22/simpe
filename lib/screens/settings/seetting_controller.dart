import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:simpe/screens/settings/newPin.dart';
import 'package:simpe/services/reuseableData.dart';

class SettingController extends GetxController {
  RxBool showiinsearch = false.obs;
  RxBool recivelink = false.obs;

  RxString pin = "".obs;
  RxString pin2 = "".obs;



}
