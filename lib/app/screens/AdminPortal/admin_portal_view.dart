import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/AdminPortal/admin_portal_controller.dart';
import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';
import '../../utils/app_colors.dart';

class AdminPortalView extends GetView<AdminPortalController> {
  AdminPortalView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    TextEditingController remarkController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Admin Portal",
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
            child: SingleChildScrollView(
              physics: const RangeMaintainingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.5,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: AppColor.rascadePurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Obx(() => Text(
                                    controller.teamName.value.isEmpty
                                        ? "Scan QR to display team name"
                                        : controller.teamName.value,
                                    style: TextStyle(
                                      color: AppColor.textColor,
                                      fontSize: 18,
                                      fontFamily: 'Rubik',
                                    ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                alignment: Alignment.center,
                                height: screenHeight * 0.05,
                                width: screenWidth * 0.35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.textColor,
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    var qrScanResult =
                                        await FlutterBarcodeScanner.scanBarcode(
                                            "#ff6666",
                                            "Cancel",
                                            true,
                                            ScanMode.QR);
                                    if (qrScanResult != '-1') {
                                      controller.updateTeamName(qrScanResult);
                                    }
                                  },
                                  child: Text(
                                    "Scan QR",
                                    style: TextStyle(
                                      color: AppColor.rascadePurple,
                                      fontFamily: "Rubik",
                                      fontSize: 23,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Rate Team",
                                style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                            ),
                          ),
                          Obx(() => Slider(
                                value: controller.currentValue.value.toDouble(),
                                min: 1,
                                max: 10,
                                divisions: 9,
                                label: controller.currentValue.value.toString(),
                                onChanged: (double newValue) {
                                  controller
                                      .updateCurrentValue(newValue.toInt());
                                },
                              )),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Remarks",
                                style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: screenWidth * 0.8,
                            child: TextField(
                              controller: remarkController,
                              decoration: const InputDecoration(
                                hintText: "(if any)",
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.comment)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: screenHeight * 0.05,
                                  width: screenWidth * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.textColor,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      FirebaseFirestore.instance
                                          .collection("teams")
                                          .doc(controller.teamName.value)
                                          .update({
                                        'rating': controller.currentValue.value,
                                        'remarks': remarkController.text,
                                      });

                                      remarkController.clear();
                                    },
                                    child: Text(
                                      "Update",
                                      style: TextStyle(
                                        color: AppColor.rascadePurple,
                                        fontFamily: "Rubik",
                                        fontSize: 23,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: screenHeight * 0.05,
                                  width: screenWidth * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.textColor,
                                  ),
                                  child: GestureDetector(
                                    onTap: () => Get.toNamed(
                                      Routes.TEAM_DETAILS,
                                      arguments: {
                                        "teamName": controller.teamName.value
                                      },
                                    ),
                                    child: Text(
                                      "View",
                                      style: TextStyle(
                                        color: AppColor.rascadePurple,
                                        fontFamily: "Rubik",
                                        fontSize: 23,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
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
          ),
        ],
      ),
    );
  }
}
