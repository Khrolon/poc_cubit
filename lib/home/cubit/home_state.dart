class HomeState {
  final int valor;

  const HomeState({this.valor = 0});

  HomeState copyWith({
    int? valor,
  }) {
    return HomeState(
      valor: valor ?? 0,
    );
  }
}
