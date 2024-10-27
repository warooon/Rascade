// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:rascade/app/screens/SignIn/signin_page_binding.dart';
import 'package:rascade/app/screens/SignUp%20Page/signup_page_binding.dart';
import 'package:rascade/app/screens/SignUp%20Page/signup_page_view.dart';

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
      page: () => LandingPageView(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInPageView(),
      binding: SigninPageBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpPageView(),
      binding: SignUpPageBinding(),
    ),

  ];
}
