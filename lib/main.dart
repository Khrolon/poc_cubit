import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_cubit/app/view/app.dart';
import 'package:poc_cubit/auth/cubit/auth_cubit.dart';
import 'package:poc_cubit/auth/repositories/auth_repository.dart';
import 'package:poc_cubit/auth/repositories/auth_repository_interface.dart';
import 'package:poc_cubit/home/view/home_page.dart';

void main() {
  final authRepository = AuthRepository();

  runApp(App(authRepository: authRepository));
}
