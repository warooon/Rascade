import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
              home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ));
        }
        return GetMaterialApp(
          title: 'Rascade',
          debugShowCheckedModeBanner: false,
          initialRoute: snapshot.data != null ? Routes.SIGN_IN : Routes.LANDING,
          getPages: AppPages.routes,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.black,
          ),
        );
      }));
}
