// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LANDING = _Paths.LANDING;
  static const SIGN_IN = _Paths.SIGN_IN;
  static const SIGN_UP = _Paths.SIGN_UP;
  static const HOME = _Paths.HOME;
  static const PROFILE = _Paths.PROFILE;
  static const QR = _Paths.QR;
  static const ADMIN = _Paths.ADMIN;
  static const TEAM_DETAILS = _Paths.TEAM_DETAILS;
}

abstract class _Paths {
  static const LANDING = '/landing';
  static const SIGN_IN = '/sign_in';
  static const SIGN_UP = '/sign_up';
  static const HOME = '/home';
  static const PROFILE = '/profile';
  static const QR = '/qr';
  static const ADMIN = '/admin';
  static const TEAM_DETAILS = '/team_details';
}
