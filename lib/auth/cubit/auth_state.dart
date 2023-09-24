import 'package:equatable/equatable.dart';

enum AuthStateStatus { initialAuth, loadingAuth, workAuth, errorAuth }

class AuthState extends Equatable {
  final String email;
  final String password;
  final AuthStateStatus status;

  const AuthState(
      {this.email = '',
      this.password = '',
      this.status = AuthStateStatus.initialAuth});

  @override
  List<Object?> get props => [email, password, status];

  AuthState copyWith({
    String? email,
    String? password,
    AuthStateStatus? status,
  }) {
    return AuthState(
        email: email ?? this.email,
        status: status ?? this.status,
        password: password ?? this.password);
  }
}
