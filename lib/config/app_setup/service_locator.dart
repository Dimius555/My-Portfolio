import 'package:get_it/get_it.dart';
import 'package:portfolio/config/localization/localization_storage.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/config/theme/theme_storage.dart';
import 'package:portfolio/data/api/auth_api.dart';
import 'package:portfolio/data/api/skills_api.dart';
import 'package:portfolio/interfaces/repositories/auth_repository.dart';
import 'package:portfolio/interfaces/repositories/skill_repositories.dart';
import 'package:portfolio/repositories/auth_repository_impl.dart';
import 'package:portfolio/repositories/skill_repository_impl.dart';
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
  sl.registerLazySingleton<AuthAPI>(() => AuthAPI());
  sl.registerLazySingleton<SkillsAPI>(() => SkillsAPI());

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authApi: sl()));
  sl.registerLazySingleton<SkillRepository>(() => SkillRepositoryImpl(skillsApi: sl()));
}
