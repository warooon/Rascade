import 'package:get/get.dart';
import 'package:rascade/app/screens/Profile/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(
      () => ProfilePageController(),
    );
  }
}
