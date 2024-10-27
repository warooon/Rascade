import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rascade_mobile_app/app/modules/UserPage/user_page_view.dart';
import 'package:rascade_mobile_app/app/modules/landing_page/landing_page_view.dart';
import 'package:rascade_mobile_app/app/theme_provider.dart';
// import 'package:rascade_mobile_app/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: UserProfile(),
          theme: themeProvider.themeData,
        );
      },
    );
  }
}
