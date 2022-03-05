import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:simpe/screens/Home/tabs_view.dart';

class LoginController extends GetxController {
  RxString username = "".obs;
  RxString pin = "".obs;

  LoginController() {
    pin.listen((p0) {
      if (p0.length > 3) {
        Get.to(TabView());
      }
    });
  }
}
