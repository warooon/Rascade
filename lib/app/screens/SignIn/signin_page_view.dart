import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/SignIn/signin_page_controller.dart';
import 'package:rascade/app/utils/app_colors.dart';
import 'package:rascade/widgets/button.dart';
import 'package:rascade/widgets/signInContainer.dart';

import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';

class SignInPageView extends GetView<SignInPageController> {
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
          SingleChildScrollView(
            physics: const RangeMaintainingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.15),
                    const LoginContainer(text: "Member Login"),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
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
                            onPressed: () => Get.toNamed(Routes.SIGN_UP),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
