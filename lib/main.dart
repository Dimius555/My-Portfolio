import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/app_setup/cubits_setup.dart';
import 'package:portfolio/config/app_setup/service_locator.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  initServiceLocator();
  await sl.allReady();
  runApp(const CubitsSetup());
}
