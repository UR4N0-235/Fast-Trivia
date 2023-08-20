import 'package:fast_trivia/app/controllers/questions_controller.dart';
import 'package:fast_trivia/app/geral_components/bottom_navbar_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// screen that show history and you can select an questionary to do.
class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionaryController questionaryController = Get.put(QuestionaryController());
    return WillPopScope(child: Scaffold(
      appBar: AppBar(title: const Text("score page")),
      body: const Text("opa"),
    ), onWillPop: () async {
      questionaryController.reset();
      Get.offAll(() => const BottomNavBar()) ;
      return true;
    });
  }
}
