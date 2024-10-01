import 'package:get/get.dart';
import 'package:rascade_mobile_app/app/modules/Home/home_controller.dart';
import 'package:rascade_mobile_app/app/modules/UserPage/user_page_controller.dart';

class UserPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserPageController>(
      () => UserPageController(),
    );
  }
}
