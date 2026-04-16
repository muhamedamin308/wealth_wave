import 'package:flutter/foundation.dart';
import 'package:wealth_wave/features/auth/presentation/bloc/create_account_state.dart';

class AuthenticationController extends ChangeNotifier {
  AuthenticationState _state = AuthenticationInitialState();

  AuthenticationState get state => _state;

  void changeState(AuthenticationState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> doCreateAccount() async {
    changeState(AuthenticationLoadingState());
    print('Simulating account creation...');

    await Future.delayed(const Duration(seconds: 2));

    // Simulate success or failure
    final isSuccess = true;

    print('Create account result: ${isSuccess ? 'Success' : 'Failure'}');

    if (isSuccess) {
      changeState(AuthenticationSuccessState());
      return true;
    } else {
      changeState(
        AuthenticationErrorState('Failed to create account. Please try again.'),
      );
      return false;
    }
  }
}
