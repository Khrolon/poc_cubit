import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_cubit/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  int _valor = 0;

  void incrementCounter() {
    _valor++;
    emit(state.copyWith(valor: _valor));
  }
}
