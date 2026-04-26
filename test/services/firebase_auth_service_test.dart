import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wealth_wave/features/auth/data/models/user_model.dart';

import '../mock/mock_firebase_auth_service.dart';

void main() {
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;
  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(
      id: '123muhamed123ahmed',
      name: 'User',
      email: 'user@gmail.com',
    );
  });

  group('SignUp Tests', () {
    test('Test sign up success', () async {
      when(
        () => mockFirebaseAuthService.signUp(
          'User',
          email: 'user@gmail.com',
          password: 'User@123s',
        ),
      ).thenAnswer((_) async => user);

      final result = await mockFirebaseAuthService.signUp(
        'User',
        email: 'user@gmail.com',
        password: 'User@123s',
      );

      expect(result, user);
    });

    test('Test sign up failure', () {
      when(
        () => mockFirebaseAuthService.signUp(
          'User',
          email: 'user@gmail.com',
          password: 'User@123s',
        ),
      ).thenThrow(Exception());

      expect(
        () => mockFirebaseAuthService.signUp(
          'User',
          email: 'user@gmail.com',
          password: 'User@123s',
        ),
        throwsA(isInstanceOf<Exception>()),
      );
    });
  });
}
