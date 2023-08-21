// that is "firula" just to change app language
import 'package:fast_trivia/app/controllers/questions_controller.dart';
import 'package:fast_trivia/app/pages/settings/components/credit_widget.dart';
import 'package:fast_trivia/app/pages/settings/components/switch_theme.dart';
import 'package:fast_trivia/db/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    QuestionaryController questionaryController =
        Get.put(QuestionaryController());
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Row(
                  children: [Text("Usar thema escuro? "), SwitchThemeWidget()]),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        DatabaseHelper.instance.clearData();
                        questionaryController.getResponsesFromDataBase();
                      },
                      child: const Text("Limpar dados"))
                ],
              ),
              const Divider(thickness: 1.5,),
              Spacer(),
              CreditsWidget()
            ],
          ),
        ));
  }
}
