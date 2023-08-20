// screen that you need to use to awser or view a questionary

import 'package:fast_trivia/app/controllers/questions_controller.dart';
import 'package:fast_trivia/app/pages/questionary/components/question_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionaryPage extends StatefulWidget {
  const QuestionaryPage({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionaryPage();
}

class _QuestionaryPage extends State<QuestionaryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuestionaryController questionaryController =
        Get.put(QuestionaryController());
    return WillPopScope(
        onWillPop: () async {
          questionaryController.reset();
          return true;
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(questionaryController.actualQuestionary.topic),
            ),
            body: Obx(
              () => SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(children: [
                        QuestionCard(
                            question:
                                questionaryController.getActualQuestion()),
                        ElevatedButton(
                            onPressed: () async {
                              // if (questionaryController.selectedAlternativeId !=
                              //     0) {
                              questionaryController.nextQuestion();
                              if(!questionaryController.isLatesteQuestion()) questionaryController.updateQuestionNumber();
                              // }else{
                              //     Get.snackbar("Aviso", "Por favor, selecione uma questao!", snackPosition: SnackPosition.BOTTOM, );
                              // }
                            },
                            child: Text(
                                questionaryController.isLatesteQuestion()
                                    ? "Enviar"
                                    : "proximo"))
                      ]))),
            )));
  }
}
