// screen that you need to use to awser or view a questionary

import 'package:fast_trivia/app/controllers/questions_controller.dart';
import 'package:fast_trivia/app/models/questionary_model.dart';
import 'package:fast_trivia/app/pages/questionary/components/question_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionaryPage extends StatefulWidget {
  final Questionary questionary;

  const QuestionaryPage({super.key, required this.questionary});

  @override
  State<StatefulWidget> createState() => _QuestionaryPage();
}

class _QuestionaryPage extends State<QuestionaryPage> {
  late Questionary questionary;

  @override
  void initState() {
    questionary = widget.questionary;
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
              title: Text(questionary.topic),
            ),
            body: Obx(
              () => SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(children: [
                        QuestionCard(
                            question: questionary.questionList[
                                questionaryController.actualQuestion]),
                        ElevatedButton(
                            onPressed: () {
                              // if (questionaryController.selectedAlternativeId !=
                              //     0) {
                                questionaryController.nextQuestion();
                              // }else{
                              //     Get.snackbar("Aviso", "Por favor, selecione uma questao!", snackPosition: SnackPosition.BOTTOM, );
                              // }
                            },
                            child: Text(questionaryController.isLatesteQuestion() ? "Enviar" :"proximo"))
                      ]))),
            )));
  }
}
