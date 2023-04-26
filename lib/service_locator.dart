import 'package:get_it/get_it.dart';
import 'package:portfolio/config/theme/theme_notifier.dart';
import 'package:portfolio/config/theme/theme_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerSingletonAsync(() async => await SharedPreferences.getInstance());
  sl.registerLazySingleton<ThemeNotifier>(() => ThemeNotifier(themeStorage: sl()));
  sl.registerLazySingleton<ThemeStorage>(() => ThemeStorage(prefs: sl()));
}
