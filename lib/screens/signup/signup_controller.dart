import 'package:get/get.dart';
import 'package:simpe/screens/signup/signup_screen.dart';
import 'package:simpe/screens/signup/signupsuccess.dart';

class SignupController extends GetxController {
  RxString pin = "".obs;

  SignupController() {
    pin.listen((p0) {
      if (p0.length > 3) {
        Get.to(SignupSucess());
      }
    });
  }
}
