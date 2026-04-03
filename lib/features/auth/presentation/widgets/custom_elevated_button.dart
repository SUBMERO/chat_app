import 'package:chat_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback? ontap;
  const CustomElevatedButton({super.key, required this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kSecondaryColor,
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyle.openSans22Bold.copyWith(
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
