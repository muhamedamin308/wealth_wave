import 'package:flutter/foundation.dart';
import 'package:wealth_wave/core/util/constants/secure_storage_keys.dart';
import 'package:wealth_wave/features/auth/data/data_source/secure_storage.dart';
import 'package:wealth_wave/features/onboarding/presentation/bloc/splash_state.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _secureStorage;
  SplashController(this._secureStorage);

  SplashState _state = SplashInitialState();

  SplashState get state => _state;

  void changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> isUserLoggedIn() async {
    final userId = await _secureStorage.read(
      key: SecureStorageKeys.currentUserId,
    );
    if (userId != null) {
      changeState(SplashSuccessState());
      return true;
    } else {
      changeState(SplashErrorState('No user logged in'));
      return false;
    }
  }
}
