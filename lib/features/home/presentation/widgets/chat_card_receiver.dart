import 'package:chat_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ChatCardReceiver extends StatelessWidget {
  final String text;
  const ChatCardReceiver({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.kLightColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyle.openSans18Bold.copyWith(
              color: AppColors.kSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
