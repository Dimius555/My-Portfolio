import 'package:flutter/material.dart';
import 'package:portfolio/config/localization/localization_notifier.dart';
import 'package:portfolio/config/localization/localization_storage.dart';
import 'package:portfolio/service_locator.dart';

class LanguagePicker extends StatefulWidget {
  const LanguagePicker({super.key, required this.onChanged});

  final Function(String?) onChanged;

  @override
  State<LanguagePicker> createState() => _LanguagePickerState();
}

class _LanguagePickerState extends State<LanguagePicker> {
  late String _selectedValue;

  @override
  void initState() {
    final localization = sl<LocalizationNotifier>().currentLocalization;
    if (localization == SupportedLocalizations.en) {
      _selectedValue = 'English';
    } else {
      _selectedValue = 'Русский';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        focusColor: Colors.transparent,
        isDense: true,
        value: _selectedValue,
        items: [
          DropdownMenuItem(
            value: 'Русский',
            onTap: () {},
            child: const Text('🇷🇺 Русский'),
          ),
          DropdownMenuItem(
            value: 'English',
            onTap: () {},
            child: const Text('🇺🇸 English'),
          ),
        ],
        onChanged: (v) async {
          setState(() {
            _selectedValue = v ?? _selectedValue;
          });
          widget.onChanged.call(v);
        });
  }
}
