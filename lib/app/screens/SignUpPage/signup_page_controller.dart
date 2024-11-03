import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rascade/app/utils/app_colors.dart';
import '../../routes/app_pages.dart';

class SignUpPageController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController teamNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> registerUser() async {
    String name = nameController.text.trim();
    String teamName = teamNameController.text.trim();
    String email = emailController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();

    // Check for empty fields
    if (name.isEmpty ||
        teamName.isEmpty ||
        email.isEmpty ||
        phoneNumber.isEmpty ||
        passwordController.text.trim().isEmpty) {
      Get.snackbar("Registration Failed", "All fields are required",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.textColor,
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          shouldIconPulse: true);
      return;
    }

    try {
      // Check if team exists
      DocumentSnapshot teamDoc =
          await _firestore.collection('teams').doc(teamName).get();

      // Check if team is full
      if (teamDoc.exists) {
        QuerySnapshot members = await _firestore
            .collection('teams')
            .doc(teamName)
            .collection('members')
            .get();

        if (members.docs.length >= 4) {
          Get.snackbar(
              "Registration Failed", "Team is full (maximum 4 members allowed)",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppColor.textColor,
              isDismissible: true,
              forwardAnimationCurve: Curves.easeOutBack,
              shouldIconPulse: true);
          return;
        }
      } else {
        // Create a new team
        await _firestore.collection('teams').doc(teamName).set({
          'teamName': teamName,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: passwordController.text.trim(),
      );

      String userId = userCredential.user!.uid;

      // Save user data to the "users" collection
      await _firestore.collection('users').doc(userId).set({
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'teamName': teamName,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Add user to the team
      await _firestore
          .collection('teams')
          .doc(teamName)
          .collection('members')
          .doc(userId)
          .set({
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Show success message
      Get.snackbar("Registration Successful",
          "You have successfully registered. Redirecting to sign-in...",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          backgroundColor: AppColor.textColor,
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          shouldIconPulse: true);

      // Redirect to sign-in after delay
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(Routes.SIGN_IN);
      });
    } catch (e) {
      Get.snackbar("Registration Failed", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.textColor,
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          shouldIconPulse: true);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    teamNameController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
