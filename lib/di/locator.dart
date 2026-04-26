import 'package:get_it/get_it.dart';
import 'package:wealth_wave/features/auth/data/data_source/secure_storage.dart';
import 'package:wealth_wave/features/auth/presentation/controller/authentication_controller.dart';
import 'package:wealth_wave/features/auth/services/firebase_auth_service.dart';
import 'package:wealth_wave/features/onboarding/presentation/controller/splash_controller.dart';
import 'package:wealth_wave/services/auth_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());

  locator.registerFactory<AuthenticationController>(
    () => AuthenticationController(
      locator.get<AuthService>(),
      const SecureStorage(),
    ),
  );

  locator.registerFactory<SplashController>(
    () => SplashController(const SecureStorage()),
  );
}
