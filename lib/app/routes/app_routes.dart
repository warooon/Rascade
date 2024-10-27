// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LANDING = _Paths.LANDING;
  static const SIGN_IN = _Paths.SIGN_IN;
  static const SIGN_UP = _Paths.SIGN_UP;
}

abstract class _Paths {
  static const LANDING = '/landing';
  static const SIGN_IN = '/sign_in';
  static const SIGN_UP = '/sign_up';
}
