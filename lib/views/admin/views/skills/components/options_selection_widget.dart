part of '../skills_view.dart';

class _OptionsSelectionWidget extends StatelessWidget {
  final Function(bool showCreateSection) onSelected;

  const _OptionsSelectionWidget({required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 32),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                onSelected.call(true);
              },
              style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0)),
              child: Text(
                'Add new skill section',
                style: theme.buttonStyle,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                onSelected.call(false);
              },
              style: TextButton.styleFrom(padding: const EdgeInsets.all(16.0)),
              child: Text(
                'Add new skill to existing section',
                style: theme.buttonStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
