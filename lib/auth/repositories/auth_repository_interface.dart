abstract class IAuthRepository {
  Future<bool> logIn(String email, String password);
}
