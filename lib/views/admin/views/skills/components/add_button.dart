part of '../skills_view.dart';

class _AddButton extends StatelessWidget {
  const _AddButton({
    required this.theme,
    required this.onPressed,
  });

  final AppTheme theme;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: theme.linksColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Center(
        child: IconButton(
          iconSize: 32,
          onPressed: () {
            onPressed.call();
          },
          icon: Center(
            child: Icon(
              Icons.add,
              color: theme.primaryBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
