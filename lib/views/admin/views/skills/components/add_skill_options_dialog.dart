part of '../skills_view.dart';

class _AddSkillOptionsDialog extends StatefulWidget {
  const _AddSkillOptionsDialog({
    required this.theme,
  });

  final AppTheme theme;

  @override
  State<_AddSkillOptionsDialog> createState() => _AddSkillOptionsDialogState();
}

class _AddSkillOptionsDialogState extends State<_AddSkillOptionsDialog> with SingleTickerProviderStateMixin {
  late Widget _displayedWidget;

  @override
  void initState() {
    _displayedWidget = _OptionsSelectionWidget(
      onSelected: (bool showCreateSection) {
        setState(() {
          _displayedWidget = const _CreateNewSkillSectionWidget();
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: _displayedWidget,
      transitionBuilder: (child, animation) {
        final Animation<Offset> offsetAnimation = Tween<Offset>(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0)).animate(animation);

        // For more difficult transition
        //
        // TweenSequence<Offset>([
        //   TweenSequenceItem(tween: Tween<Offset>(begin: Offset(1.0, 1.0), end: Offset(0.0, 0.0)), weight: 1),
        //   TweenSequenceItem(tween: Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)), weight: 1)
        // ]).animate(animation);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
