import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/Home/home_controller.dart';
import 'package:rascade/app/utils/app_colors.dart';
import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            "Home",
            style: TextStyle(
                color: AppColor.textColor,
                fontFamily: "Rubik",
                fontWeight: FontWeight.w800,
                fontSize: 40),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColor.textColor),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppColor.textColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                "Menu",
                style: TextStyle(
                    color: AppColor.rascadePurple,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "NicoMoji"),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: AppColor.rascadePurple,
                size: 30,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                    color: AppColor.rascadePurple,
                    fontFamily: "NicoMoji",
                    fontSize: 20),
              ),
              onTap: () =>
                  Get.toNamed(Routes.PROFILE, arguments: controller.userId),
            ),
            ListTile(
              leading: Icon(
                Icons.qr_code_2,
                color: AppColor.rascadePurple,
                size: 30,
              ),
              title: Text(
                "View QR",
                style: TextStyle(
                    color: AppColor.rascadePurple,
                    fontFamily: "NicoMoji",
                    fontSize: 20),
              ),
              onTap: () => Get.toNamed(Routes.QR),
            ),
            Obx(() {
              if (controller.isAdmin.value) {
                return ListTile(
                  leading: Icon(
                    Icons.qr_code_2,
                    color: AppColor.rascadePurple,
                    size: 30,
                  ),
                  title: Text(
                    "Admin Portal",
                    style: TextStyle(
                        color: AppColor.rascadePurple,
                        fontFamily: "NicoMoji",
                        fontSize: 20),
                  ),
                  onTap: () => Get.toNamed(Routes.ADMIN),
                );
              } else {
                return const SizedBox();
              }
            }),
            ListTile(
              leading: Icon(
                Icons.exit_to_app_outlined,
                color: AppColor.rascadePurple,
                size: 30,
              ),
              title: const Text(
                "Sign Out",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontFamily: "NicoMoji",
                    fontSize: 20),
              ),
              onTap: () => controller.signOut(),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          IgnorePointer(child: ParticleSystem()),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/robot_2.png",
                      height: 150,
                      width: 150,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.5,
                          child: Text(
                            "Welcome!",
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontFamily: "NicoMoji",
                              fontSize: 30,
                            ),
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        Obx(() {
                          return SizedBox(
                            width: screenWidth * 0.5,
                            child: Text(
                              controller.userName.value,
                              style: TextStyle(
                                color: AppColor.textColor,
                                fontFamily: "NicoMoji",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.fade,
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: AppColor.textColor,
                      ),
                      Text(
                        "Team Details",
                        style: TextStyle(
                            color: AppColor.textColor,
                            fontFamily: "NicoMoji",
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Container(
                  height: screenHeight * 0.25,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.textColor,
                  ),
                  child: Obx(() {
                    if (controller.teamMembers.isEmpty) {
                      return Center(
                        child: Text(
                          "No members found in your team.",
                          style: TextStyle(color: AppColor.textColor),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: controller.teamMembers.length - 1,
                      itemBuilder: (context, index) {
                        final memberData = controller.teamMembers[index + 1];
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.PROFILE,
                                    arguments: memberData['uid']);
                              },
                              child: Container(
                                width: screenWidth * 0.6,
                                margin: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.01),
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: AppColor.rascadePurple,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.rascadePurple,
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    memberData['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: AppColor.textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.leaderboard,
                        color: AppColor.textColor,
                      ),
                      Text(
                        "LeaderBoard",
                        style: TextStyle(
                            color: AppColor.textColor,
                            fontFamily: "NicoMoji",
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Container(
                  height: screenHeight * 0.25,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.textColor),
                  child: const Column(
                    children: [
                      // Obx(() {
                      //   if (controller.teamMembers.isEmpty) {
                      //     return Text("No leaderboard data available.");
                      //   }
                      //   return ListView.builder(
                      //     itemCount: controller.teamMembers.length,
                      //     itemBuilder: (context, index) {
                      //       final memberData = controller.teamMembers[index];
                      //       return ListTile(
                      //         title: Text(memberData['name']),
                      //         subtitle:
                      //             Text(memberData['score']?.toString() ?? "0"),
                      //       );
                      //     },
                      //   );
                      // }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
