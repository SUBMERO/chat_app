import 'package:chat_app/core/routers/router_handler.dart';
import 'package:chat_app/core/routers/router_names.dart';
import 'package:chat_app/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      onGenerateRoute: RouterHandler.generateRoute,
      initialRoute: RouterNames.login,
      home: const LoginPage(),
    );
  }
}
