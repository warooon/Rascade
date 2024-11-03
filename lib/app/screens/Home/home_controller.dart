import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../routes/app_pages.dart';

class HomeController extends GetxController {
  // Observable properties
  var userName = ''.obs;
  String userId = '';
  var teamMembers = <Map<String, dynamic>>[].obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserName();
    fetchTeamMembers();
  }

  void fetchUserName() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final userDoc =
          await _firestore.collection("users").doc(currentUser.uid).get();
      if (userDoc.exists) {
        userName.value = userDoc.data()?['name'] ?? '';
      }
    }
  }

  // Fetch team members from the users collection
  void fetchTeamMembers() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      userId = currentUser.uid;

      final userDoc =
          await _firestore.collection("users").doc(currentUser.uid).get();
      if (userDoc.exists) {
        final teamName = userDoc.data()?['teamName'];
        if (teamName != null) {
          final membersSnapshot = await _firestore
              .collection('teams')
              .doc(teamName)
              .collection('members')
              .get();

          // Clear previous data
          teamMembers.clear();

          for (var memberDoc in membersSnapshot.docs) {
            // Add each member's data to the observable list
            teamMembers.add({
              'uid': memberDoc.id,
              'name': memberDoc.data()['name'],
              'email': memberDoc.data()['email'],
              // Add other fields as needed
            });
          }
        }
      }
    }
  }

  // Sign out method
  void signOut() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.LANDING);
  }
}
