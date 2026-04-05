// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chat_app/core/constants/constants.dart';

class ChatTextFiled extends StatelessWidget {
  final VoidCallback? onTap;
  const ChatTextFiled({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      minLines: 1,
      keyboardType: TextInputType.multiline,

      style: AppTextStyle.openSans20Bold.copyWith(
        color: AppColors.kSecondaryColor,
      ),
      decoration: InputDecoration(
        hintText: 'Message',
        hintStyle: AppTextStyle.openSans20Bold.copyWith(
          color: AppColors.kLightColor,
        ),
        suffixIcon: InkWell(
          onTap: onTap,
          child: Icon(
            Icons.send_rounded,
            size: 35,
            color: AppColors.kSecondaryColor,
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
