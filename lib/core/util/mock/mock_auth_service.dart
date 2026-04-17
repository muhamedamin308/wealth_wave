import 'package:wealth_wave/features/auth/data/models/user_model.dart';
import 'package:wealth_wave/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      if (password == 'wrongpassword') {
        throw Exception();
      }

      return UserModel(
        id: 1,
        email: email,
        name: 'John Doe',
        password: password,
      );
    } on Exception catch (e) {
      if (password == 'wrongpassword') {
        throw Exception('Incorrect password, please try again');
      }
      throw Exception('Failed to sign in: $e');
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> signUp(
    String name, {
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      if (password.startsWith('123')) {
        throw Exception();
      }

      return UserModel(id: 1, email: email, name: name, password: password);
    } on Exception catch (e) {
      if (password.startsWith('123')) {
        throw Exception(
          'Password is too weak, please choose a stronger password',
        );
      }
      throw Exception('Failed to sign up: $e');
    }
  }
}
