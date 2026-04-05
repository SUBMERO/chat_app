import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/features/home/presentation/widgets/chat_text_filed.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        centerTitle: true,
        title: Text(
          'Chat App',
          style: AppTextStyle.indieFlower36Bold.copyWith(
            color: AppColors.kSecondaryColor,
          ),
        ),
      ),
      backgroundColor: AppColors.kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Align(
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
                        'data data data data',
                        style: AppTextStyle.openSans18Bold.copyWith(
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ChatTextFiled(),
          ],
        ),
      ),
    );
  }
}
