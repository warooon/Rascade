// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:rascade/app/screens/AdminPortal/admin_portal_binding.dart';
import 'package:rascade/app/screens/AdminPortal/admin_portal_view.dart';
import 'package:rascade/app/screens/Home/home_binding.dart';
import 'package:rascade/app/screens/Home/home_view.dart';
import 'package:rascade/app/screens/Profile/profile_page_binding.dart';
import 'package:rascade/app/screens/Profile/profile_page_view.dart';
import 'package:rascade/app/screens/QRscanner/qr_scanner_binding.dart';
import 'package:rascade/app/screens/QRscanner/qr_scanner_view.dart';
import 'package:rascade/app/screens/SignIn/signin_page_binding.dart';
import 'package:rascade/app/screens/SignUpPage/signup_page_binding.dart';
import 'package:rascade/app/screens/SignUpPage/signup_page_view.dart';
import 'package:rascade/app/screens/Team_Details/team_details_binding.dart';
import 'package:rascade/app/screens/Team_Details/team_details_controller.dart';
import 'package:rascade/app/screens/Team_Details/team_details_view.dart';

import '../screens/LandingPage/landing_page_binding.dart';
import '../screens/LandingPage/landing_page_view.dart';
import '../screens/SignIn/signin_page_view.dart';
// import 'package:travellio/app/utils/main_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANDING;

  static final routes = [
    GetPage(
      name: _Paths.LANDING,
      page: () => const LandingPageView(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInPageView(),
      binding: SigninPageBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpPageView(),
      binding: SignUpPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
    GetPage(
      name: _Paths.QR,
      page: () => const QrScannerView(),
      binding: QrScannerBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminPortalView(),
      binding: AdminPortalBinding(),
    ),
    GetPage(
      name: _Paths.TEAM_DETAILS,
      page: () => const TeamDetailsView(),
      binding: TeamDetailsBinding(),
    ),
  ];
}
