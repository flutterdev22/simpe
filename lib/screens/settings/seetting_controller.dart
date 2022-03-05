import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class SettingController extends GetxController {
  RxBool showiinsearch = false.obs;
  RxBool recivelink = false.obs;

  RxString pin = "".obs;
}
