import 'package:flutter/foundation.dart';
import 'package:wealth_wave/features/auth/data/models/user_model.dart';
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

  Future<bool> doCreateAccount({required UserModel userModel}) async {
    changeState(AuthenticationLoadingState());
    try {
      final user = await _authService.signUp(
        userModel.name!,
        email: userModel.email!,
        password: userModel.password!,
      );
      if (user != null) {
        changeState(AuthenticationSuccessState());
        return true;
      } else {
        changeState(AuthenticationErrorState('Failed to create account'));
        return false;
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
    changeState(AuthenticationLoadingState());
    try {
      final user = await _authService.signIn(email: email, password: password);
      if (user != null) {
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
