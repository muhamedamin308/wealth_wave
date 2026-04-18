import 'package:flutter/foundation.dart';
import 'package:wealth_wave/core/util/constants/secure_storage_keys.dart';
import 'package:wealth_wave/features/auth/data/data_source/secure_storage.dart';
import 'package:wealth_wave/features/auth/presentation/bloc/authentication_state.dart';
import 'package:wealth_wave/services/auth_service.dart';

class AuthenticationController extends ChangeNotifier {
  final AuthService _authService;

  AuthenticationController(this._authService);
  AuthenticationState _state = AuthenticationInitialState();

  AuthenticationState get state => _state;

  void changeState(AuthenticationState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> doLogout() async {
    final secureStorage = SecureStorage();
    changeState(AuthenticationLoadingState());
    try {
      await _authService.signOut();
      await secureStorage.delete(key: SecureStorageKeys.currentUserId);
      changeState(AuthenticationSuccessState());
      return true;
    } catch (e) {
      changeState(AuthenticationErrorState(e.toString()));
      return false;
    }
  }

  Future<bool> doCreateAccount(
    String name, {
    required String email,
    required String password,
  }) async {
    final secureStorage = SecureStorage();
    changeState(AuthenticationLoadingState());
    try {
      final user = await _authService.signUp(
        name,
        email: email,
        password: password,
      );
      if (user != null) {
        secureStorage.write(
          key: SecureStorageKeys.currentUserId,
          value: user.toJson(),
        );
        changeState(AuthenticationSuccessState());
        return true;
      } else {
        throw Exception('Failed to create account');
      }
    } catch (e) {
      changeState(AuthenticationErrorState(e.toString()));
      return false;
    }
  }

  Future<bool> doLogin({
    required String email,
    required String password,
  }) async {
    final secureStorage = SecureStorage();
    changeState(AuthenticationLoadingState());
    try {
      final user = await _authService.signIn(email: email, password: password);
      if (user != null) {
        secureStorage.write(
          key: SecureStorageKeys.currentUserId,
          value: user.toJson(),
        );
        changeState(AuthenticationSuccessState());
        return true;
      } else {
        changeState(AuthenticationErrorState('Failed to log in'));
        return false;
      }
    } catch (e) {
      changeState(AuthenticationErrorState(e.toString()));
      return false;
    }
  }
}
