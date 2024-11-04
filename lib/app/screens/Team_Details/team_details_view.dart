import 'package:cloud_firestore/cloud_firestore.dart';
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

    final String teamName = Get.arguments?["teamName"] ?? "Team Name";

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
                      teamName == "" ? "Team Name" : teamName,
                      style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 30,
                          fontFamily: "NicoMoji",
                          fontWeight: FontWeight.bold),
                    ),
                    teamName != ""
                        ? FutureBuilder<DocumentSnapshot>(
                            future: FirebaseFirestore.instance
                                .collection("teams")
                                .doc(teamName)
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }

                              if (snapshot.hasError) {
                                return const Text(
                                  "Error loading rating",
                                  style: TextStyle(color: Colors.red),
                                );
                              }

                              if (!snapshot.hasData || !snapshot.data!.exists) {
                                return const Text(
                                  "No rating available",
                                  style: TextStyle(color: Colors.grey),
                                );
                              }

                              var rating =
                                  snapshot.data!.get("rating") ?? "N/A";

                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "rating: ",
                                    style: TextStyle(
                                      color: AppColor.textColor,
                                      fontSize: 18,
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "$rating/10",
                                    style: TextStyle(
                                      color: AppColor.textColor,
                                      fontSize: 18,
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "rating: ",
                                style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 18,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "10/10",
                                style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 18,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                                ),
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
                      teamName != ""
                          ? FutureBuilder<QuerySnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection("teams")
                                  .doc(teamName)
                                  .collection("members")
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                }

                                if (snapshot.hasError) {
                                  return const Text(
                                    "Error loading members",
                                    style: TextStyle(color: Colors.red),
                                  );
                                }

                                if (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty) {
                                  return const Text(
                                    "No members available",
                                    style: TextStyle(color: Colors.grey),
                                  );
                                }

                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    var memberDoc = snapshot.data!.docs[index];
                                    var memberName = memberDoc.get("name") ??
                                        "Member $index";
                                    var username = memberDoc.get("name") ??
                                        "username_$index";

                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  memberName,
                                                  style: TextStyle(
                                                    color: AppColor.textColor,
                                                    fontSize: 18,
                                                    fontFamily: 'NicoMoji',
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor:
                                                        AppColor.textColor,
                                                    decorationThickness: 3,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.01),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      username,
                                                      style: TextStyle(
                                                        color:
                                                            AppColor.textColor,
                                                        fontFamily: "Rubik",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Image.asset(
                                                      "assets/images/arrow.png",
                                                      color: AppColor.textColor,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              height: screenHeight *
                                                  0.02), // Spacing between items
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          : Text(
                              "NO MEMBERS",
                              style: TextStyle(
                                color: AppColor.textColor,
                                fontSize: 18,
                                fontFamily: 'NicoMoji',
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.textColor,
                                decorationThickness: 3,
                              ),
                            ),
                      SizedBox(height: screenHeight * 0.02),
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
