import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/Team_Details/team_details_controller.dart';
import 'package:rascade/app/utils/app_colors.dart';
import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';

class TeamDetailsView extends GetView<TeamDetailsController> {
  const TeamDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          IgnorePointer(child: ParticleSystem()),
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Team Name",
                      style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 30,
                          fontFamily: "NicoMoji",
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "rating: ",
                          style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 18,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "10/10",
                          style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 18,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                height: screenHeight * 0.43,
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
                                    "Member 1",
                                    style: TextStyle(
                                        color: AppColor.textColor,
                                        fontSize: 18,
                                        fontFamily: 'NicoMoji',
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColor.textColor,
                                        decorationThickness: 3),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "username_1",
                                        style: TextStyle(
                                            color: AppColor.textColor,
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset("assets/images/arrow.png", color: AppColor.textColor,)
                                    ],
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
                                    "Member 2",
                                    style: TextStyle(
                                        color: AppColor.textColor,
                                        fontSize: 18,
                                        fontFamily: 'NicoMoji',
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColor.textColor,
                                        decorationThickness: 3),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "username_2",
                                        style: TextStyle(
                                            color: AppColor.textColor,
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset("assets/images/arrow.png", color: AppColor.textColor,)
                                    ],
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
                                    "Member_3",
                                    style: TextStyle(
                                        color: AppColor.textColor,
                                        fontSize: 18,
                                        fontFamily: 'NicoMoji',
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColor.textColor,
                                        decorationThickness: 3),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "username_3",
                                        style: TextStyle(
                                            color: AppColor.textColor,
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset("assets/images/arrow.png", color: AppColor.textColor,)
                                    ],
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
                                    "Member_4",
                                    style: TextStyle(
                                        color: AppColor.textColor,
                                        fontSize: 18,
                                        fontFamily: 'NicoMoji',
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColor.textColor,
                                        decorationThickness: 3),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "username_4",
                                        style: TextStyle(
                                            color: AppColor.textColor,
                                            fontFamily: "Rubik",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset("assets/images/arrow.png", color: AppColor.textColor,)
                                    ],
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
                onTap: () => Get.offAllNamed(Routes.ADMIN),
                child: Image.asset(
                  "assets/images/arrow_2.png",
                  color: AppColor.textColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
