import 'package:fast_trivia/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';

class SwitchThemeWidget extends StatelessWidget {
  const SwitchThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.themeSwitch.value,
        onChanged: (value) => AppController.instance.changeTheme(value));
  }
}
