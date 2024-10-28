import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/LandingPage/landing_page_controller.dart';
import 'package:rascade/app/screens/Profile/profile_page_controller.dart';
import 'package:rascade/app/utils/app_colors.dart';
import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 80,
                        child: Stack(children: [
                          Positioned(
                            bottom: 5,
                            right: -5,
                            child:  Image.asset(
                              "assets/images/edit.png",
                              width: 60,
                              height: 60,
                              color: Colors.red,
                            ),
                          ),
                          const Positioned(
                            top: 30,
                            left: 30,
                            child: Icon(
                              Icons.person,
                              size: 100,
                            ),
                          ),
                        ]),
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
                          Text(
                            "Team Name",
                            style: TextStyle(
                                color: AppColor.textColor,
                                fontSize: 18,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
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
                                    Text(
                                      "Username",
                                      style: TextStyle(
                                          color: AppColor.textColor,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
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
                                    Text(
                                      "team_name_1",
                                      style: TextStyle(
                                          color: AppColor.textColor,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
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
                                    Text(
                                      "abc@xyz.com",
                                      style: TextStyle(
                                          color: AppColor.textColor,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
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
                                    Text(
                                      "+91-999999999",
                                      style: TextStyle(
                                          color: AppColor.textColor,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
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
        ],
      ),
    );
  }
}
