// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class AdminPortalController extends GetxController {
  var currentValue = 1.obs;

  void updateCurrentValue(int value) {
    currentValue.value = value;
  }
}
