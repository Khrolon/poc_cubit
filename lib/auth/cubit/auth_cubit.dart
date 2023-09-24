import 'dart:math';

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
        super(const AuthState());

  Future<void> validateLogin() async {
    emit(state.copyWith(
      email: emailController.text,
      password: passwordController.text,
      status: AuthStateStatus.loadingAuth,
    ));

    try {
      await authRepository.logIn(
        state.email,
        state.password,
      );
      emit(state.copyWith(status: AuthStateStatus.workAuth));
    } catch (e) {
      emit(state.copyWith(status: AuthStateStatus.errorAuth));
    }
  }
}
