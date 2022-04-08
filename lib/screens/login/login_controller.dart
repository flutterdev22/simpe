import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  RxString username = "".obs;
  RxString pin = "".obs;

  LoginController() {
    pin.listen((p0) {
      if (p0.length > 3) {
        // Get.to(TabView());
      }
    });
  }
}
