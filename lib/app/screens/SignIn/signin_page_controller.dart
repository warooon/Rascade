import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rascade/app/utils/app_colors.dart';
import '../../routes/app_pages.dart';

class SignInPageController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;
  RxBool emailIsValid = false.obs;
  RxBool rememberMe = false.obs;

  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login() async {
    if (emailc.text.isEmpty || passwordc.text.isEmpty) {
      Get.snackbar("Error", "Empty Fields!");
      return;
    }
    isLoading.value = true;
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: emailc.text.trim(), password: passwordc.text);

      if (credential.user != null) {
        if (credential.user!.emailVerified) {
          Get.offAllNamed(Routes.HOME);
        } else {
          await _promptEmailVerification(credential.user!);
        }
      }
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
    } catch (e) {
      Get.snackbar("Error", "Error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  void _handleAuthError(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      Get.snackbar("Error", "Account not found");
    } else if (e.code == 'wrong-password') {
      Get.snackbar("Error", "Wrong Password");
    } else {
      Get.snackbar("Error", "Error: ${e.message}");
    }
  }

  Future<void> _promptEmailVerification(User user) async {
    Get.defaultDialog(
      title: "Email Not Yet Verified!",
      content: const Text("Send verification email"),
      textConfirm: "Send",
      textCancel: "Back",
      onCancel: () => Get.back(),
      backgroundColor: AppColor.textColor,
      onConfirm: () async {
        try {
          await user.sendEmailVerification();
          Get.back();
          Get.snackbar("Success", "Verification email sent!",
              backgroundColor: AppColor.textColor,
              isDismissible: true,
              forwardAnimationCurve: Curves.easeOutBack,
              shouldIconPulse: true);
        } catch (e) {
          Get.snackbar("Error", "Failed to send verification email.",
              backgroundColor: AppColor.textColor,
              isDismissible: true,
              forwardAnimationCurve: Curves.easeOutBack,
              shouldIconPulse: true);
        }
      },
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black,
      buttonColor: Colors.black,
    );
  }
}
