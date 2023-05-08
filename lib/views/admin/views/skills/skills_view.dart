import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/global/skills_cubit/skills_cubit.dart';
import 'package:portfolio/views/admin/admin_pannel_components/custom_text_field.dart';
import 'package:portfolio/views/widgets/custom/custom_button.dart';

part 'components/add_button.dart';
part 'components/options_selection_widget.dart';
part 'components/create_new_skill_section_widget.dart';
part 'components/add_skill_options_dialog.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Skills',
                  style: theme.regular0,
                ),
                _AddButton(
                  theme: theme,
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (cntxt) {
                          return _AddSkillOptionsDialog(theme: theme);
                        });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
