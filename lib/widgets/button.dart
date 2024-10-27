import 'package:flutter/material.dart';

import '../app/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;
  final bool showArrow;

  const CustomButton({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
    this.showArrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColor.rascadePurple,
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: showArrow ? Alignment.centerLeft : Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: showArrow
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: AppColor.textColor,
                  fontFamily: 'Rubik',
                  fontSize: 18,
                ),
              ),
              if (showArrow)
                Image.asset(
                  'assets/images/arrow.png',
                  color: AppColor.textColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
