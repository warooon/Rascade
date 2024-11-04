import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/Profile/profile_page_controller.dart';

import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';
import '../../utils/app_colors.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final String userId = Get.arguments;
    controller.fetchUserData(userId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "User Details",
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
          SingleChildScrollView(
            physics: const RangeMaintainingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/images/robot.png",
                        // size: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "All the best!",
                            style: TextStyle(
                                color: AppColor.textColor,
                                fontSize: 25,
                                fontFamily: "NicoMoji",
                                fontWeight: FontWeight.bold),
                          ),
                          Obx(() {
                            return Text(
                              controller.userData['teamName'] ?? "Team Name",
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 18,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: AppColor.rascadePurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: AppColor.textColor,
                                    fontSize: 18,
                                    fontFamily: 'NicoMoji',
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColor.textColor,
                                    decorationThickness: 3),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Obx(() {
                                return Text(
                                  controller.userData['name'] ?? "Username",
                                  style: TextStyle(
                                      color: AppColor.textColor,
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.bold),
                                );
                              }),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        // Team Name
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Team Name",
                                style: TextStyle(
                                    color: AppColor.textColor,
                                    fontSize: 18,
                                    fontFamily: 'NicoMoji',
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColor.textColor,
                                    decorationThickness: 3),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Obx(() {
                                return Text(
                                  controller.userData['teamName'] ??
                                      "Team Name",
                                  style: TextStyle(
                                      color: AppColor.textColor,
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.bold),
                                );
                              }),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        // Email ID
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email ID",
                                style: TextStyle(
                                    color: AppColor.textColor,
                                    fontSize: 18,
                                    fontFamily: 'NicoMoji',
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColor.textColor,
                                    decorationThickness: 3),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Obx(() {
                                return Text(
                                  controller.userData['email'] ?? "abc@xyz.com",
                                  style: TextStyle(
                                      color: AppColor.textColor,
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.bold),
                                );
                              }),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),

                        // Phone Number
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone Number",
                                style: TextStyle(
                                    color: AppColor.textColor,
                                    fontSize: 18,
                                    fontFamily: 'NicoMoji',
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColor.textColor,
                                    decorationThickness: 3),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Obx(() {
                                return Text(
                                  controller.userData['phoneNumber'] ??
                                      "+91-999999999",
                                  style: TextStyle(
                                      color: AppColor.textColor,
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.bold),
                                );
                              }),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                GestureDetector(
                  onTap: () => Get.offAllNamed(Routes.HOME),
                  child: Image.asset(
                    "assets/images/arrow_2.png",
                    color: AppColor.textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
