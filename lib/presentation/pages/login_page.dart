import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/presentation/widgets/custom_elevated_button.dart';
import 'package:chat_app/presentation/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chat App',
          style: AppTextStyle.indieFlower36Bold.copyWith(
            color: AppColors.kSecondaryColor,
          ),
        ),
      ),
      backgroundColor: AppColors.kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Jlogo.png', width: 200),
                const SizedBox(height: 64),
                Text(
                  'LOGIN',
                  style: AppTextStyle.openSans32Bold.copyWith(
                    color: AppColors.kSecondaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(hint: 'Email'),
                const SizedBox(height: 10),
                CustomTextField(hint: 'Password'),
                const SizedBox(height: 32),
                CustomElevatedButton(),
                const SizedBox(height: 16),
                Text(
                  'don\'t have account?  register now',
                  style: AppTextStyle.openSans20Bold.copyWith(
                    color: AppColors.kSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
