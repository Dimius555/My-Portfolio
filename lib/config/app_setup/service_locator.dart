import 'package:get_it/get_it.dart';
import 'package:portfolio/config/localization/localization_storage.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/config/theme/theme_storage.dart';
import 'package:portfolio/data/api/admin_api/auth_api_impl.dart';
import 'package:portfolio/interfaces/auth_api.dart';
import 'package:portfolio/interfaces/auth_repository.dart';
import 'package:portfolio/repositories/auth_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization/localization_notifier.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  // Storages
  sl.registerSingletonAsync(() async => await SharedPreferences.getInstance());

  sl.registerLazySingleton<ThemeStorage>(() => ThemeStorage(prefs: sl()));
  sl.registerLazySingleton<LocalizationStorage>(() => LocalizationStorage(prefs: sl()));

  // Notifiers

  sl.registerLazySingleton<ThemeNotifier>(() => ThemeNotifier(themeStorage: sl()));
  sl.registerLazySingleton<LocalizationNotifier>(() => LocalizationNotifier(localizationStorage: sl()));

  // APIs
  sl.registerLazySingleton<AuthApi>(() => AuthAPIImpl());

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authApi: sl()));
}
