part of '../skills_view.dart';

class _CreateNewSkillSectionWidget extends StatefulWidget {
  const _CreateNewSkillSectionWidget();

  @override
  State<_CreateNewSkillSectionWidget> createState() => _CreateNewSkillSectionWidgetState();
}

class _CreateNewSkillSectionWidgetState extends State<_CreateNewSkillSectionWidget> {
  bool _isProgressSkillSelected = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _tootipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Center(
      child: Container(
        width: 440,
        decoration: BoxDecoration(
          color: theme.primaryBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Material(
                color: theme.primaryBackgroundColor,
                child: Text(
                  'New skill section',
                  style: theme.header3,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _nameController,
              label: 'Section name',
            ),
            const SizedBox(height: 20),
            Material(
              color: theme.primaryBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        'Progress section',
                        style: theme.regular4,
                      ),
                      Checkbox(
                          activeColor: theme.linksColor,
                          value: _isProgressSkillSelected,
                          onChanged: (v) {
                            setState(() {
                              _isProgressSkillSelected = true;
                            });
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Facts section', style: theme.regular4),
                      Checkbox(
                          activeColor: theme.linksColor,
                          value: !_isProgressSkillSelected,
                          onChanged: (v) {
                            setState(() {
                              _isProgressSkillSelected = false;
                            });
                          }),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              maxLines: 5,
              controller: _tootipController,
              label: 'Displayed tooltip',
            ),
            const SizedBox(height: 40),
            CustomButton(
              horizontalPaddings: 100,
              onPressed: () {
                SkillsCubit.read(context).createSkillSection(
                  _nameController.text,
                  _isProgressSkillSelected,
                  _tootipController.text,
                );
                Navigator.pop(context);
              },
              title: 'Create new section',
              customColor: theme.linksColor,
            )
          ],
        ),
      ),
    );
  }
}
