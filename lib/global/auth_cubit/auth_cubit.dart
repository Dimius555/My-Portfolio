import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/interfaces/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthState watchState(BuildContext context) => context.watch<AuthCubit>().state;
  static AuthCubit read(BuildContext context) => context.read<AuthCubit>();

  AuthCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthState(isAuthorized: false, isLoading: true));

  final AuthRepository _authRepository;

  void checkAuth() {
    final isAuthorized = _authRepository.checkAuthorization();
    log('👨‍💻 Admin is authorized: $isAuthorized');
    emit(AuthState(isAuthorized: isAuthorized, isLoading: false));
  }

  Future<void> login(String email, String password) async {
    try {
      emit(AuthState(isAuthorized: false, isLoading: true));
      await _authRepository.login(email, password);
      emit(AuthState(isAuthorized: true, isLoading: true));
      Future.delayed(const Duration(seconds: 3)).then(
        (value) => emit(
          AuthState(isAuthorized: true, isLoading: false),
        ),
      );
    } catch (e) {
      emit(AuthState(isAuthorized: false, isLoading: false));
      log(e.toString());
    }
  }

  void logout() async {
    await _authRepository.logout();
    emit(AuthState(isAuthorized: false, isLoading: false));
  }
}
