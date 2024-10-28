import 'package:get/get.dart';
import 'package:rascade/app/screens/SignUpPage/signup_page_controller.dart';

class SignUpPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpPageController>(
      () => SignUpPageController(),
    );
  }
}
