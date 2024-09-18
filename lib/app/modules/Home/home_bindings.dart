import 'package:get/get.dart';
import 'package:rascade_mobile_app/app/modules/Home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
