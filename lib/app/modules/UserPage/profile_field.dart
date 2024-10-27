import 'package:flutter/material.dart';
import 'package:rascade_mobile_app/app/modules/UserPage/color.dart';

class ProfileField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;

  const ProfileField({
    required this.label,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: textcolor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Color.fromARGB(255, 248, 248, 248),
            prefixIcon: Icon(
              icon,
              color: Colors.black54,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
