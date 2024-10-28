import 'package:get/get.dart';
import 'package:rascade/app/screens/AdminPortal/admin_portal_controller.dart';

class AdminPortalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminPortalController>(
      () => AdminPortalController(),
    );
  }
}
