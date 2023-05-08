abstract class AuthApi {
  Future<void> login(String email, String password);
  bool checkAuthorization();
  Future<void> logout();
}
