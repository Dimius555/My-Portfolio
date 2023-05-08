import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/config/app_setup/main_app.dart';
import 'package:portfolio/config/app_setup/service_locator.dart';
import 'package:portfolio/global/auth_cubit/auth_cubit.dart';

class CubitsSetup extends StatelessWidget {
  const CubitsSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (_) => AuthCubit(
            authRepository: sl(),
          ),
        )
      ],
      child: MainApp(),
    );
  }
}
