import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_cubit/app/cubit/app_cubit.dart';
import 'package:poc_cubit/app/cubit/app_state.dart';
import 'package:poc_cubit/app/routes/routes.dart';
import 'package:poc_cubit/auth/cubit/auth_cubit.dart';
import 'package:poc_cubit/auth/repositories/auth_repository_interface.dart';
import 'package:poc_cubit/auth/view/auth_page.dart';
import 'package:poc_cubit/home/cubit/home_cubit.dart';
import 'package:poc_cubit/home/view/home_page.dart';

class App extends StatefulWidget {
  final IAuthRepository _authRepository;

  const App({
    Key? key,
    required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget._authRepository,
      child: BlocProvider(
        create: (_) => AppCubit(authRepository: widget._authRepository),
        child: AppView(widget._authRepository),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  final IAuthRepository _authRepository;

  const AppView(this._authRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: Routes(_authRepository).onGenerateRoute,
      home: BlocBuilder<AppCubit, AppState>(
          builder: (BuildContext context, AppState state) {

        return state.status == AppStatus.logged
            ? BlocProvider.value(value: HomeCubit(), child: const HomePage())
            : BlocProvider.value(
                value: AuthCubit(_authRepository), child: AuthPage());
      }),
    );
  }
}
