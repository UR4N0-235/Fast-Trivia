import 'package:fast_trivia/app/controllers/app_controller.dart';
import 'package:fast_trivia/app/geral_components/bottom_navbar_component.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, isDark, child) {
        return MaterialApp(
          title: 'Fast Trivia',
          theme: ThemeData(
              useMaterial3: true,
              brightness: isDark ? Brightness.dark : Brightness.light
          ),
          debugShowCheckedModeBanner: false,
          home: const BottomNavBar(),
        );
      },
    );
  }
}
