import 'package:get/get.dart';
import 'package:rascade/app/screens/SignIn/signin_page_controller.dart';
import 'package:rascade/app/screens/SignUp%20Page/signup_page_controller.dart';

class SignUpPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpPageController>(
      () => SignUpPageController(),
    );
  }
}
