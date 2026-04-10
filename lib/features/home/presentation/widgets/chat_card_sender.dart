import 'package:chat_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ChatCardSender extends StatelessWidget {
  final String text;
  const ChatCardSender({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.kSecondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyle.openSans18Bold.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
