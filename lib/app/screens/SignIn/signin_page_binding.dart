import 'package:get/get.dart';
import 'package:rascade/app/screens/SignIn/signin_page_controller.dart';

class SigninPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInPageController>(
      () => SignInPageController(),
    );
  }
}
