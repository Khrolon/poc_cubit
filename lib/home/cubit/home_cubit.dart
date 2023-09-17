import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_cubit/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(ContadorHomeState(valor: 0));

  int _valor = 0;

  void incrementCounter() {
    _valor++;
    emit(ContadorHomeState(valor: _valor));
  }
}
