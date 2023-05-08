import 'package:portfolio/data/api/auth_api.dart';
import 'package:portfolio/interfaces/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthAPI authApi}) : _api = authApi;

  final AuthAPI _api;

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
