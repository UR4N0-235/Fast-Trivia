// that is "firula" just to change app language
import 'package:fast_trivia/app/pages/settings/components/switch_theme.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<StatefulWidget> createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SwitchThemeWidget()
      ],
    );
  }
}
