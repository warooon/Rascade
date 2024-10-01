import 'package:flutter/material.dart';
import 'package:rascade_mobile_app/app/modules/landing_page/landing_page_controller.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    
    
    return const Scaffold(
      backgroundColor: Color(0xffE6C6EB),
      body: Column(
        children: [
          SizedBox(height: 170),
          Text(
            "Rascade",
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w400,
              fontFamily: 'NicoMoji',
              color: Color(0xFF423844),
            ),
          ),
          Stack(
            children: [
              Image(
                image: AssetImage(
                    'lib/assets/images/aalok_logo_1_-removebg-preview.png'),
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
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.only(top: 260.0, left: 35),
            child: ElevatedButton(
                onPressed: signin,
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff36103D)),
                    fixedSize: WidgetStatePropertyAll(Size(345, 55))),
                child: Row(
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
            padding: EdgeInsets.only(top: 20.0, left: 35),
            child: ElevatedButton(
                onPressed: signup,
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff36103D)),
                    fixedSize: WidgetStatePropertyAll(Size(345, 55))),
                child: Row(
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
