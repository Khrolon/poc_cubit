import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_cubit/auth/cubit/auth_cubit.dart';
import 'package:poc_cubit/auth/repositories/auth_repository_interface.dart';
import 'package:poc_cubit/auth/view/auth_page.dart';
import 'package:poc_cubit/home/cubit/home_cubit.dart';
import 'package:poc_cubit/home/view/home_page.dart';

class Routes {
  final IAuthRepository _authRepository;

  Routes(this._authRepository);

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/home':
        return MaterialPageRoute<AuthPage>(
          builder: (_) => BlocProvider.value(
            value: HomeCubit(),
            child: const HomePage(),
          ),
        );
      default:
        return MaterialPageRoute<AuthPage>(
          builder: (_) => BlocProvider.value(
            value: AuthCubit(_authRepository),
            child: AuthPage(),
          ),
        );
    }
  }
}
