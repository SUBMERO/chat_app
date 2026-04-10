import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/core/routers/router_names.dart';
import 'package:chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:chat_app/features/auth/presentation/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.pushReplacementNamed(context, RouterNames.home);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Success'),
              backgroundColor: Colors.greenAccent,
            ),
          );
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
      builder: (context, state) {
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
                child: ListView(
                  children: [
                    const SizedBox(height: 64),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Jlogo.png', width: 200),
                      ],
                    ),
                    const SizedBox(height: 64),
                    Text(
                      'LOGIN',
                      style: AppTextStyle.openSans32Bold.copyWith(
                        color: AppColors.kSecondaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hint: 'Email',
                      isPassword: false,
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hint: 'Password',
                      isPassword: true,
                      onChanged: (data) {
                        password = data;
                      },
                    ),
                    const SizedBox(height: 32),
                    CustomElevatedButton(
                      title: 'LOGIN',
                      ontap: () {
                        if (email != null && password != null) {
                          context.read<AuthCubit>().loginUser(
                            email: email!,
                            password: password!,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter email and password'),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouterNames.register);
                      },
                      child: Text(
                        'don\'t have account?  register now',
                        style: AppTextStyle.openSans20Bold.copyWith(
                          color: AppColors.kSecondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
