// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/LandingPage/landing_page_controller.dart';
import 'package:rascade/app/screens/SignUpPage/signup_page_controller.dart';
import 'package:rascade/app/utils/app_colors.dart';
import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  const SignUpPageView({super.key});

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
            "User Profile",
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
              physics: RangeMaintainingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.67,
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
                            padding: EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Name",
                                style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: screenWidth * 0.8,
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: "username",
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.person)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Team Name",
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
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: "team name",
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ClipOval(child: Icon(Icons.people)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email ID",
                                style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: screenWidth * 0.8,
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: "abc@email.com",
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.email)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Phone Number",
                                style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: screenWidth * 0.8,
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: "+91-999999999",
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.phone)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 18,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: screenWidth * 0.8,
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: "********",
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.lock)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  GestureDetector(
                    onTap: ()=> Get.offAllNamed(Routes.HOME),
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(-1.0, -1.0),
                        child: Image.asset(
                          "assets/images/arrow_2.png",
                          color: AppColor.textColor,
                        )),
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
