import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poc_cubit/auth/cubit/auth_state.dart';
import 'package:poc_cubit/auth/repositories/auth_repository_interface.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository authRepository;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  AuthCubit(this.authRepository)
      : emailController = TextEditingController(),
        passwordController = TextEditingController(),
        super(InitialAuthState());

  Future<void> validateLogin() async {
    emit(LoadingAuthState());

    bool validade = await authRepository.logIn(
        emailController.text, passwordController.text);

    if (validade) {
      emit(WorkAuthState());
    } else {
      emit(ErrorAuthState());
    }
  }
}
