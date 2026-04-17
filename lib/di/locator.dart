import 'package:get_it/get_it.dart';
import 'package:wealth_wave/core/util/mock/mock_auth_service.dart';
import 'package:wealth_wave/features/auth/presentation/controller/authentication_controller.dart';
import 'package:wealth_wave/services/auth_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthService>(() => MockAuthService());

  locator.registerFactory<AuthenticationController>(
    () => AuthenticationController(locator.get<AuthService>()),
  );
}
