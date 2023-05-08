import 'package:flutter/widgets.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/data/models/skill_section_model.dart';
import 'package:portfolio/global/skills_cubit/skills_cubit.dart';
import 'package:portfolio/views/admin/admin_pannel_components/custom_text_field.dart';
import 'package:portfolio/views/widgets/custom/custom_button.dart';

class EditSkillSectionDialog extends StatefulWidget {
  const EditSkillSectionDialog({super.key, required this.section});

  final SkillSectionModel section;

  @override
  State<EditSkillSectionDialog> createState() => _EditSkillSectionDialogState();
}

class _EditSkillSectionDialogState extends State<EditSkillSectionDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _tooltipController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.section.name);
    _tooltipController = TextEditingController(text: widget.section.tooltip);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: AppTheme.read(context).primaryBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              CustomTextField(controller: _nameController, label: 'Section name'),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _tooltipController,
                label: 'Section tooltip',
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  SkillsCubit.read(context).editSkillSection(
                    widget.section.copyWith(
                      name: _nameController.text,
                      tooltip: _tooltipController.text,
                    ),
                  );
                  Navigator.pop(context);
                },
                title: 'Save changes',
                customColor: AppTheme.read(context).accentPositiveColor,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
