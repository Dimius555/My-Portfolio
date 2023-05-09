import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/constants/app_constants.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/data/models/skill_model.dart';
import 'package:portfolio/data/models/skill_section_model.dart';
import 'package:portfolio/global/skills_cubit/skills_cubit.dart';
import 'package:portfolio/views/admin/admin_pannel_components/custom_text_field.dart';
import 'package:portfolio/views/admin/views/skills/dialogs/add_skill_dialog.dart';
import 'package:portfolio/views/admin/views/skills/dialogs/edit_skill_section_dialog.dart';
import 'package:portfolio/views/widgets/custom/custom_button.dart';

part 'components/add_button.dart';
part 'components/options_selection_widget.dart';
part 'components/create_new_skill_section_widget.dart';
part 'dialogs/add_skill_options_dialog.dart';
part 'components/skill_component.dart';

class SkillsView extends StatefulWidget {
  const SkillsView({super.key});

  @override
  State<SkillsView> createState() => _SkillsViewState();
}

class _SkillsViewState extends State<SkillsView> {
  @override
  void initState() {
    SkillsCubit.read(context).fetchAllSkillsSections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final skillsState = SkillsCubit.watchState(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 64,
              child: Row(
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
            ),
            if (skillsState.skillSections.isNotEmpty)
              Column(
                children: _fetchSections(skillsState.skillSections, theme),
              ),
            if (skillsState.skillSections.isEmpty)
              Padding(
                padding: const EdgeInsets.all(64.0),
                child: Text(
                  'There is no skill here yet',
                  style: theme.regular2,
                ),
              )
          ],
        ),
      ),
    );
  }

  List<Widget> _fetchSections(List<SkillSectionModel> sections, AppTheme theme) {
    final List<Widget> list = [];

    for (var section in sections) {
      list.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: ExpansionTile(
          initiallyExpanded: false,
          title: Row(
            children: [
              Text(
                section.name,
                style: theme.header3,
              ),
              const SizedBox(width: 10),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (cntxt) {
                          return EditSkillSectionDialog(section: section);
                        });
                  },
                  icon: Icon(Icons.edit_outlined, color: theme.linksColor)),
              const SizedBox(width: 10),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (cntxt) {
                          return AddOrEditSkillDialog(section: section);
                        });
                  },
                  icon: Icon(Icons.add, color: theme.linksColor)),
              const SizedBox(width: 10),
              IconButton(
                  onPressed: () {
                    SkillsCubit.read(context).removeSection(section);
                  },
                  icon: Icon(Icons.delete_outline, color: theme.linksColor)),
            ],
          ),
          children: _fetchSkillsComponentsList(section.skills, section),
        ),
      ));
    }

    return list;
  }

  List<Widget> _fetchSkillsComponentsList(List<SkillModel> skills, SkillSectionModel sectionModel) {
    final List<Widget> list = [];

    for (var skill in skills) {
      list.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: _SkillComponent(
          skill: skill,
          section: sectionModel,
        ),
      ));
    }

    return list;
  }
}
