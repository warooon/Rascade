import 'package:get/get.dart';
import 'package:rascade/app/screens/QRscanner/qr_scanner_controller.dart';

class QrScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrScannerController>(
      () => QrScannerController(),
    );
  }
}
