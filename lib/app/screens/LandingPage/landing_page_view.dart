import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/LandingPage/landing_page_controller.dart';
import 'package:rascade/app/utils/app_colors.dart';
import 'package:rascade/widgets/button.dart';

import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';

class LandingPageView extends GetView<LandingPageController> {
  const LandingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ParticleSystem(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Rascade",
                    style: TextStyle(
                      color: AppColor.rascadePurple,
                      fontSize: 56,
                      fontFamily: 'NicoMoji',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        'assets/images/rascade_logo.png',
                        color: AppColor.rascadePurple,
                      ),
                      Positioned(
                        left: screenWidth * 0.4,
                        child: Text(
                          "code your vision",
                          style: TextStyle(
                            color: AppColor.glitchGrey,
                            fontSize: 24,
                            fontFamily: 'RubikGlitch',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              CustomButton(
                width: screenWidth * 0.85,
                height: screenHeight * 0.075,
                text: "Sign In",
                onPressed: () => Get.toNamed(Routes.SIGN_IN),
                showArrow: true,
              ),
              const SizedBox(height: 20),
              CustomButton(
                width: screenWidth * 0.85,
                height: screenHeight * 0.075,
                text: "Sign Up",
                onPressed: () => {},
                showArrow: true,
              )
            ],
          ),
        ],
      ),
    );
  }
}
