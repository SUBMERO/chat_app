import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/core/routers/router_names.dart';
import 'package:chat_app/presentation/pages/login_page.dart';
import 'package:chat_app/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

class RouterHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterNames.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case RouterNames.register:
        return MaterialPageRoute(builder: (context) => const RegisterPage());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'Oops there is an error',
                style: AppTextStyle.openSans32Bold,
              ),
            ),
          ),
        );
    }
  }
}
