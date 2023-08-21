import 'package:fast_trivia/app/controllers/questions_controller.dart';
import 'package:fast_trivia/app/geral_components/bottom_navbar_component.dart';
import 'package:fast_trivia/app/geral_components/correction/correction_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// screen that show history and you can select an questionary to do.
class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionaryController questionaryController =
        Get.put(QuestionaryController());
        questionaryController.getResponsesFromDataBase();
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(title: const Text("score page")),
          body: Center(
              child: Column(
            children: [
              Text(
                  "opa, voce acertou ${questionaryController.numOfCorrectAns}/10"),
              Wrap(
                  alignment: WrapAlignment.start, // Alinhar itens à esquerda
                  spacing: 8.0, // Espaçamento horizontal entre os itens
                  runSpacing: 8.0, // Espaçamento vertical entre as linhas
                  children: List.generate(
                      questionaryController.responses.length,
                      (index) => GestureDetector(
                            onTap: () => Get.to(CorrectionPage(
                              question: questionaryController
                                  .actualQuestionary.questionList[index],
                              selectedAlternativeId: questionaryController.responses[index + 1],
                            )),
                            child: Container(
                              width: 100, // Largura dos itens
                              height: 100, // Altura dos itens
                              color: (questionaryController
                                      .alternativeCorrection[index])
                                  ? Colors.blue
                                  : Colors.red,
                              child: Center(
                                child: Text('$index'),
                              ),
                            ),
                          )))
            ],
          )),
        ),
        onWillPop: () async {
          questionaryController.reset();
          Get.offAll(() => const BottomNavBar());
          return true;
        });
  }
}
