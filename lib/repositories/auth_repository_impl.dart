import 'package:portfolio/interfaces/auth_api.dart';
import 'package:portfolio/interfaces/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthApi authApi}) : _api = authApi;

  final AuthApi _api;

  @override
  bool checkAuthorization() {
    return _api.checkAuthorization();
  }

  @override
  Future<void> login(String email, String password) {
    return _api.login(email, password);
  }

  @override
  Future<void> logout() {
    return _api.logout();
  }
}
