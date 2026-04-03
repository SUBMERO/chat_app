import 'package:chat_app/core/routers/router_handler.dart';
import 'package:chat_app/core/routers/router_names.dart';
import 'package:chat_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/features/auth/presentation/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    BlocProvider(
      create: (context) => AuthCubit(
        AuthRepositoryImpl(remoteDataSource: AuthRemoteDataSource()),
      ),
      child: const ChatApp(),
    ),
  );
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
