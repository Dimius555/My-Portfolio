import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/constants/app_constants.dart';
import 'package:portfolio/config/router/routes.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/views/admin/admin_pannel_components/custom_text_field.dart';
import 'package:portfolio/views/widgets/custom/custom_button.dart';

class UnauthorizedWidget extends StatefulWidget {
  const UnauthorizedWidget({super.key, required this.pushAdminCallback});

  final Function pushAdminCallback;

  @override
  State<UnauthorizedWidget> createState() => _UnauthorizedWidgetState();
}

class _UnauthorizedWidgetState extends State<UnauthorizedWidget> {
  final TextEditingController _keyController = TextEditingController();
  bool _shouldLogin = false;
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: _shouldLogin ? _enteringKey(theme) : _unauthStatus(theme),
    );
  }

  Widget _enteringKey(AppTheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(),
        Text(
          'Please, enter admin key',
          style: theme.regular1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 44),
        Material(
          child: SizedBox(
            width: 240,
            child: CustomTextField(
              controller: _keyController,
              label: 'Admin Key',
              errorMessage: _errorText,
              onChanged: (str) {
                setState(() {
                  _errorText = null;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 44),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              customColor: theme.accentPositiveColor,
              onPressed: () {
                if (_keyController.text == AppConstants.adminKey) {
                  widget.pushAdminCallback.call();
                } else {
                  setState(() {
                    _errorText = 'Wrong key';
                  });
                }
              },
              title: 'Countinue',
            ),
            const SizedBox(width: 20),
            CustomButton(
              customColor: theme.appSecondaryColor,
              onPressed: () {
                GoRouter.of(context).pushReplacementNamed(Routes.home);
              },
              title: 'Back home',
            )
          ],
        ),
        const Spacer(),
      ],
    );
  }

  Widget _unauthStatus(AppTheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(),
        Text(
          'You are not logged in to admin pannel!\nPlease log in or go back at home page.',
          style: theme.regular1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 44),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              customColor: theme.accentPositiveColor,
              onPressed: () {
                setState(() {
                  _shouldLogin = true;
                });
              },
              title: 'Log in',
            ),
            const SizedBox(width: 20),
            CustomButton(
              customColor: theme.appSecondaryColor,
              onPressed: () {
                GoRouter.of(context).pushReplacementNamed(Routes.home);
              },
              title: 'Back home',
            )
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
