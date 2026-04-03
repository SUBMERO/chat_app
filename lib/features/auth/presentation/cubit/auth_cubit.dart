import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthInitialState());

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    try {
      await authRepository.signUp(email, password);
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    try {
      await authRepository.signIn(email, password);
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
    }
  }
}
