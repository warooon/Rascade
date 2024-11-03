import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rascade/app/utils/app_colors.dart';
import '../../../widgets/customTextField.dart';
import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';
import 'signup_page_controller.dart';

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
                          CustomTextField(
                            label: "Name",
                            hintText: "username",
                            icon: Icons.person,
                            controller: controller.nameController,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            label: "Team Name",
                            hintText: "team name",
                            icon: Icons.people,
                            controller: controller.teamNameController,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            label: "Email ID",
                            hintText: "abc@email.com",
                            icon: Icons.email,
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            label: "Phone Number",
                            hintText: "+91-999999999",
                            icon: Icons.phone,
                            controller: controller.phoneNumberController,
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            label: "Password",
                            hintText: "********",
                            icon: Icons.lock,
                            controller: controller.passwordController,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Get.offAllNamed(Routes.LANDING),
                        child: Image.asset(
                          "assets/images/arrow_2.png",
                          color: AppColor.textColor,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.1),
                      GestureDetector(
                        onTap: () => controller.registerUser(),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(-1.0, -1.0),
                          child: Image.asset(
                            "assets/images/arrow_2.png",
                            color: AppColor.textColor,
                          ),
                        ),
                      ),
                    ],
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
