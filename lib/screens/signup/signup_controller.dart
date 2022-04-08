import 'package:get/get.dart';

class SignupController extends GetxController {
  RxString pin = "".obs;

  SignupController() {
    pin.listen((p0) {
      if (p0.length > 3) {

      }
    });
  }

}
