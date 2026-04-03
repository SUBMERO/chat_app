import 'package:chat_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> signUp(String email, String password) async {
    try {
      await remoteDataSource.signUp(email, password);
    } catch (e) {
      if (e == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e == 'email-already-in-use') {
        throw ('The account already exists for that email.');
      } else {
        throw 'Registration failed: $e';
      }
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await remoteDataSource.signIn(email, password);
    } catch (e) {
      if (e == 'user-not-found') {
        throw ('No user found for that email.');
      } else if (e == 'wrong-password') {
        throw ('Wrong password provided for that user.');
      } else {
        throw 'Login failed: $e';
      }
    }
  }
}
