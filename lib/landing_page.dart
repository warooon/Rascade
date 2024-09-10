import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rascade_mobile_app/theme/theme_provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("use Drawer to switch the Theme",style: TextStyle(fontSize: 15),),
        backgroundColor: Color(0xffE6C6EB),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Color(0xff36103D)),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: themeProvider.themeData.colorScheme.surface,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoSwitch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              ),
              const SizedBox(height: 10),
              Text(
                "Light         Dark",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: themeProvider.themeData.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xffE6C6EB),
      body: Column(
        children: [
          const SizedBox(height: 150),
          const Text(
            "Rascade",
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w400,
              fontFamily: 'NicoMoji',
              color: Color(0xFF423844),
            ),
          ),
          const Stack(
            children: [
              Image(
                image: AssetImage('lib/assets/images/aalok_logo_1_-removebg-preview.png'),
                width: 185,
                height: 162,
              ),
              Padding(
                padding: EdgeInsets.only(left: 150.0),
                child: Text(
                  "code your vision",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'RubikGlitch',
                    color: Color(0xFF968B98),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 240.0, left: 41),
            child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff36103D)),
                    fixedSize: WidgetStatePropertyAll(Size(345, 55))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xffEECBF4)),
                    ),
                    Image(
                      image: AssetImage('lib/assets/images/Image 2.png'),
                      width: 25,
                      height: 25,
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 41),
            child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff36103D)),
                    fixedSize: WidgetStatePropertyAll(Size(345, 55))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xffEECBF4)),
                    ),
                    Image(
                      image: AssetImage('lib/assets/images/Image 2.png'),
                      width: 25,
                      height: 25,
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
