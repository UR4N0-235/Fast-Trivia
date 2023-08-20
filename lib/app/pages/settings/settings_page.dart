// that is "firula" just to change app language
import 'package:fast_trivia/app/pages/settings/components/switch_theme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text("Use dark theme? "),
            SwitchThemeWidget()
          ]
        )
      ],
    );
  }
}
