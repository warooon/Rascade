import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rascade_mobile_app/app/modules/UserPage/user_page_view.dart';
import 'package:rascade_mobile_app/landing_page.dart';
import 'package:rascade_mobile_app/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
