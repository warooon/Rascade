// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePageController extends GetxController {
  var userData = {}.obs; 

  void fetchUserData(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        userData.value = documentSnapshot.data() as Map<String, dynamic>;
      } else {
        userData.value = {}; 
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }
}
