import 'package:poc_cubit/auth/repositories/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<bool> logIn(String email, String password) async {
    
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'vitor' && password == '123') {
      return true;
    } else {
      return false;
    }
  }
}
