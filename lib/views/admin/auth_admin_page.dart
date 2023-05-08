import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/constants/app_constants.dart';
import 'package:portfolio/config/router/routes.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/global/auth_cubit/auth_cubit.dart';
import 'package:portfolio/views/admin/admin_pannel_components/admin_app_bar.dart';
import 'package:portfolio/views/admin/admin_pannel_components/custom_text_field.dart';
import 'package:portfolio/views/widgets/custom/custom_button.dart';

class AuthAdminPage extends StatelessWidget {
  AuthAdminPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = AppTheme.read(context);
    final state = AuthCubit.watchState(context);
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        bloc: AuthCubit.read(context)..checkAuth(),
        listener: (context, state) {
          if (state.isAuthorized) {
            GoRouter.of(context).pushNamed(Routes.adminPannel);
          }
        },
        child: Column(
          children: [
            const AdminAppBar(),
            const Spacer(),
            state.isLoading
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(44),
                        decoration: BoxDecoration(
                            color: theme.primaryBackgroundColor,
                            boxShadow: [
                              BoxShadow(color: theme.shadowColor, blurRadius: 12),
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            )),
                        width: size.width > AppConstants.mobileModeBorderWidth ? 500 : size.width * 0.8,
                        child: Column(
                          children: [
                            CustomTextField(controller: _emailController, label: 'Email'),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: _passwordController,
                              label: 'Password',
                              isSecured: true,
                            ),
                            const SizedBox(height: 20),
                            CustomButton(
                              onPressed: () {
                                AuthCubit.read(context).login(_emailController.text, _passwordController.text);
                              },
                              title: 'Login',
                              customColor: theme.accentPositiveColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
