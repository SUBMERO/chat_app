import 'package:chat_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  const CustomTextField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle.openSans20Bold.copyWith(
        color: AppColors.kSecondaryColor,
      ),
      decoration: InputDecoration(
        hint: Text(
          hint,
          style: AppTextStyle.openSans20Bold.copyWith(
            color: AppColors.kLightColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.kLightColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.kSecondaryColor, width: 3),
        ),

        fillColor: Colors.white24,
        filled: true,
      ),
    );
  }
}
