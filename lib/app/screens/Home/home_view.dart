
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rascade/app/screens/Home/home_controller.dart';
import 'package:rascade/app/utils/app_colors.dart';
import '../../../widgets/particles/particle_system.dart';
import '../../routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
              onTap: () => Get.toNamed(Routes.PROFILE),
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
            ListTile(
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
            ),
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
              onTap: () => Get.offAllNamed(Routes.LANDING),
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
                  children: [
                    Image.asset(
                      "assets/images/robot_2.png",
                      height: 150,
                      width: 150,
                    ),
                    Text(
                      "Hii ",
                      style: TextStyle(
                          color: AppColor.rascadePurple,
                          fontFamily: "NicoMoji",
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      "username!",
                      style: TextStyle(
                          color: AppColor.textColor,
                          fontFamily: "NicoMoji",
                          fontSize: 25),
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
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Container(
                  height: screenHeight * 0.25,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.textColor),
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
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Container(
                  height: screenHeight * 0.25,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.textColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
