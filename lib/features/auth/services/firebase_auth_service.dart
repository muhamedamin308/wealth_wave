import 'package:firebase_auth/firebase_auth.dart';
import 'package:wealth_wave/core/common/extenstions/extenstions.dart';
import 'package:wealth_wave/features/auth/data/models/user_model.dart';
import 'package:wealth_wave/services/auth_service.dart';

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<UserModel?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;
      if (user == null) throw Exception('Sign-in failed: user is null');
      return user.toUserModel();
    } catch (e) {
      throw Exception('Failed to log in: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> signUp(
    String name, {
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;
      if (user == null) {
        throw Exception('Account creation failed: user is null');
      }

      // Update display name (Firebase Auth)
      await user.updateDisplayName(name);
      // Force refresh to get updated displayName
      await user.reload();
      final updatedUser = _auth.currentUser!;

      return updatedUser.toUserModel();
    } catch (e) {
      throw Exception('Failed to create account: $e');
    }
  }
}
