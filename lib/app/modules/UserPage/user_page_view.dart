import 'package:flutter/material.dart';
import 'package:rascade_mobile_app/app/modules/UserPage/color.dart';
import 'package:rascade_mobile_app/app/modules/UserPage/profile_field.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text(
                "User Profile",
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 28,
                  color: titlecolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                  color: Colors.black54,
                  thickness: 2,
                  indent: 120,
                  endIndent: 120),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(166, 255, 255, 255),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        right: 5,
                        bottom: 5,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.black,
                          child:
                              Icon(Icons.edit, color: Colors.white, size: 18),
                        ),
                      ),
                      Container(
                          width: 100,
                          child: Image.asset(
                              "lib/assets/images/user_profile.png")),
                    ],
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "user_name",
                        style: TextStyle(
                          color: textcolor,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        "team name",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 420,
                child: Container(
                  decoration: BoxDecoration(
                    color: backgroundcolor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(210, 158, 158, 158)
                            .withOpacity(0.3),
                        spreadRadius: 4,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProfileField(
                          label: "Name",
                          hintText: "user_name",
                          icon: Icons.person_outline_rounded,
                        ),
                        const SizedBox(height: 10),
                        const ProfileField(
                          label: "Team Name",
                          hintText: "user_team_name",
                          icon: Icons.groups,
                        ),
                        const SizedBox(height: 10),
                        const ProfileField(
                          label: "Email-Id",
                          hintText: "user_nameemail@gmail.com",
                          icon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 10),
                        const ProfileField(
                          label: "Phone number",
                          hintText: "+91-9999999990",
                          icon: Icons.phone_outlined,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Transform.rotate(
                    angle: 3.13,
                    child: GestureDetector(
                        child: Image.asset(
                      "lib/assets/images/back_arrow.png",
                      width: 50,
                      color: Colors.black,
                    ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
