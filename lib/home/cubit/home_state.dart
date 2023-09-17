abstract class HomeState {}

class InitialHomeState extends HomeState {}

class ContadorHomeState extends HomeState {
  final int valor;
  ContadorHomeState({required this.valor});
}
