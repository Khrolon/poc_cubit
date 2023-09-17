import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_cubit/app/cubit/app_state.dart';
import 'package:poc_cubit/auth/cubit/auth_state.dart';
import 'package:poc_cubit/auth/repositories/auth_repository_interface.dart';

class AppCubit extends Cubit<AppState> {
  final IAuthRepository _authRepository;

  AppCubit({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AppState(status: AppStatus.notLogged));
}
