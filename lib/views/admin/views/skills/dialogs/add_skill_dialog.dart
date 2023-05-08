import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/data/models/skill_model.dart';
import 'package:portfolio/data/models/skill_section_model.dart';
import 'package:portfolio/global/skills_cubit/skills_cubit.dart';
import 'package:portfolio/views/admin/admin_pannel_components/custom_text_field.dart';
import 'package:portfolio/views/widgets/custom/custom_button.dart';

class AddOrEditSkillDialog extends StatefulWidget {
  const AddOrEditSkillDialog({super.key, required this.section, this.skillModel});

  final SkillModel? skillModel;
  final SkillSectionModel section;

  @override
  State<AddOrEditSkillDialog> createState() => _AddOrEditSkillDialogState();
}

class _AddOrEditSkillDialogState extends State<AddOrEditSkillDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _infoController;
  double _levelValue = 50;

  @override
  void initState() {
    if (widget.skillModel != null) {
      _nameController = TextEditingController(text: widget.skillModel!.name);
      _infoController = TextEditingController(text: widget.skillModel?.info ?? '');
      _levelValue = widget.skillModel!.level * 100;
    } else {
      _nameController = TextEditingController();
      _infoController = TextEditingController();
    }

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
              CustomTextField(controller: _nameController, label: 'Skill name'),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _infoController,
                label: 'Skill info (optional)',
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Level',
                  style: AppTheme.read(context).regular4,
                ),
              ),
              Material(
                color: AppTheme.read(context).primaryBackgroundColor,
                child: Slider(
                  value: _levelValue,
                  max: 100,
                  divisions: 100,
                  label: _levelValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _levelValue = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  SkillsCubit.read(context).editSkill(
                    widget.section,
                    widget.skillModel!.copyWith(
                      name: _nameController.text,
                      info: _infoController.text.isNotEmpty ? _infoController.text : null,
                      level: _levelValue / 100,
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
