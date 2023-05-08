part of 'auth_cubit.dart';

class AuthState {
  final bool isAuthorized;
  final bool isLoading;

  AuthState({
    required this.isAuthorized,
    required this.isLoading,
  });
}
