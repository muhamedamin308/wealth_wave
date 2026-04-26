import 'package:firebase_auth/firebase_auth.dart';
import 'package:wealth_wave/features/auth/data/models/user_model.dart';

extension ToUserModel on User? {
  UserModel toUserModel() {
    final user = this;
    if (user != null) {
      return UserModel(
        id: user.uid,
        name: user.displayName,
        email: user.email,
      );
    } else {
      throw Exception('User credential does not contain a valid user');
    }
  }
}
