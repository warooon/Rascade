import 'package:get/get.dart';
import 'package:rascade/app/screens/LandingPage/landing_page_controller.dart';

class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingPageController>(
      () => LandingPageController(),
    );
  }
}
