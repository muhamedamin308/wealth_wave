import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wealth_wave/core/util/constants/secure_storage_keys.dart';
import 'package:wealth_wave/features/auth/data/models/user_model.dart';
import 'package:wealth_wave/features/auth/presentation/bloc/authentication_state.dart';
import 'package:wealth_wave/features/auth/presentation/controller/authentication_controller.dart';

import '../../mock/mock_firebase_auth_service.dart';
import '../../mock/mock_secure_storage.dart';

void main() {
  late AuthenticationController authController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;
  setUp(() {
    mockSecureStorage = MockSecureStorage();
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(
      id: '123muhaned123',
      name: 'User',
      email: 'user@gmail.com',
    );
    authController = AuthenticationController(
      mockFirebaseAuthService,
      mockSecureStorage,
    );
  });

  group('Authentication Controller Tests', () {
    test('Signup controller test success state', () async {
      expect(authController.state, isInstanceOf<AuthenticationInitialState>());

      when(
        () => mockSecureStorage.write(
          key: SecureStorageKeys.currentUserId,
          value: user.toJson(),
        ),
      ).thenAnswer((_) async {});

      when(
        () => mockFirebaseAuthService.signUp(
          'User',
          email: 'user@gmail.com',
          password: 'User123a',
        ),
      ).thenAnswer((_) async => user);

      await authController.doCreateAccount(
        'User',
        email: 'user@gmail.com',
        password: 'User123a',
      );

      expect(authController.state, isInstanceOf<AuthenticationSuccessState>());
    });


    test('Signup controller test error state', () async {
      expect(authController.state, isInstanceOf<AuthenticationInitialState>());

      when(
        () => mockSecureStorage.write(
          key: SecureStorageKeys.currentUserId,
          value: user.toJson(),
        ),
      ).thenAnswer((_) async {});

      when(
        () => mockFirebaseAuthService.signUp(
          'User',
          email: 'user@gmail.com',
          password: 'User@123s',
        ),
      ).thenThrow(Exception());

      await authController.doCreateAccount(
        'User',
        email: 'user@gmail.com',
        password: 'User123a',
      );

      expect(authController.state, isInstanceOf<AuthenticationErrorState>());
    });
  });
  
}
