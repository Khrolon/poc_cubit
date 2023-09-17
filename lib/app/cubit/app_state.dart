enum AppStatus { loading, logged, notLogged, erroAuth }

class AppState {
  final AppStatus status;

  const AppState({required this.status});
}
