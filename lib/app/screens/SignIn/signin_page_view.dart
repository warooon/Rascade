import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/LandingPage/landing_page_controller.dart';
import 'package:rascade/app/utils/app_colors.dart';
import 'package:rascade/widgets/button.dart';
import 'package:rascade/widgets/signInContainer.dart';

import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';

class SignInPageView extends GetView<LandingPageController> {
  const SignInPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          IgnorePointer(child: ParticleSystem()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginContainer(text: "Member Login"),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth*0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: AppColor.textColor),
                        ),
                         CustomButton(
                            width: screenWidth * 0.35,
                            height: screenHeight * 0.05,
                            text: "Sign Up",
                            showArrow: true,
                            onPressed: () {},
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
