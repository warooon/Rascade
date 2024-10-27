import 'package:flutter/material.dart';

import '../app/utils/app_colors.dart';

class LoginContainer extends StatelessWidget {
  final String text;

  const LoginContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.58,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: AppColor.rascadePurple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Image.asset("assets/images/rascade_logo.png"),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 30,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
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
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "abc@email.com",
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/user_icon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: screenWidth * 0.8,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/password_icon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.05,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.textColor,
                  ),
                  child: GestureDetector(
                    // onTap: () => print("Login Pressed"),
                    child: Text(
                      "Login",
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
              const SizedBox(height: 5),
              GestureDetector(
                // onTap: () => print("Forgot Password Pressed"),
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -15,
            right: -30,
            child: Image.asset(
              "assets/images/robot.png",
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
