import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/QRscanner/qr_scanner_controller.dart';
import 'package:rascade/app/utils/app_colors.dart';
import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';
import "package:qr_flutter/qr_flutter.dart";

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
                // Image.asset(
                //   "assets/images/QR.png",
                //   color: Colors.white,
                // ),
                FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return const Center(
                          child: Text("Error loading team name"));
                    }

                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return const Center(child: Text("User data not found"));
                    }

                    // Extract the teamName from the document data
                    String teamName =
                        snapshot.data!['teamName'] ?? "No Team Name";

                    return Center(
                      child: QrImageView(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: Colors.transparent,
                        data: teamName,
                        size: 250,
                        foregroundColor: Colors.white,
                      ),
                    );
                  },
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
