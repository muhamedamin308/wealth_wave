import 'package:firebase_auth/firebase_auth.dart';
import 'package:wealth_wave/core/common/extenstions/extenstions.dart';
import 'package:wealth_wave/features/auth/data/models/user_model.dart';
import 'package:wealth_wave/services/auth_service.dart';

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserModel?> signIn({required String email, required String password}) {
    return _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
          (result) =>
              result.user != null ? result.toUserModel() : throw Exception(),
        )
        .catchError((e) => throw Exception('Failed to log in: $e'));
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }

  @override
  Future<UserModel?> signUp(
    String name, {
    required String email,
    required String password,
  }) async {
    return _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
          (result) =>
              result.user != null ? result.toUserModel() : throw Exception(),
        )
        .catchError(
          (error) => throw Exception('Failed to create account: $error'),
        );
  }
}
