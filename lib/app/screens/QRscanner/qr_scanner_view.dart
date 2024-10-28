import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/QRscanner/qr_scanner_controller.dart';
import 'package:rascade/app/utils/app_colors.dart';
import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';

class QrScannerView extends GetView<QrScannerController> {
  const QrScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "QR Scanner",
            style: TextStyle(
                color: AppColor.textColor,
                fontFamily: "Rubik",
                fontWeight: FontWeight.w800,
                fontSize: 40),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          IgnorePointer(child: ParticleSystem()),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Image.asset(
                  "assets/images/QR.png",
                  color: Colors.white,
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Text(
                  "scan to know more!",
                  style: TextStyle(
                      fontFamily: "NicoMoji",
                      color: AppColor.textColor,
                      fontSize: 20),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                GestureDetector(
                  onTap: () => Get.offAllNamed(Routes.HOME),
                  child: Image.asset(
                    "assets/images/arrow_2.png",
                    color: AppColor.textColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
