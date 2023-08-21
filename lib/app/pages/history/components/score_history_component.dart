import 'package:fast_trivia/app/controllers/questions_controller.dart';
import 'package:fast_trivia/app/models/questionary_model.dart';
import 'package:fast_trivia/app/models/questionary_responses_model.dart';
import 'package:fast_trivia/app/geral_components/correction/correction_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// screen that show history and you can select an questionary to do.
class HistoryScore extends StatelessWidget {
  const HistoryScore({super.key, required this.actualQuestionaryResponse});

  final QuestionaryResponse actualQuestionaryResponse;

  @override
  Widget build(BuildContext context) {
    QuestionaryController questionaryController =
        Get.put(QuestionaryController());
    Questionary actualQuestionary = questionaryController
        .questionaries[actualQuestionaryResponse.questionaryId - 1];

    return Scaffold(
      appBar: AppBar(title: const Text("score page")),
      body: Center(
          child: Column(
        children: [
          Text(
              "opa, voce acertou ${actualQuestionaryResponse.correctQuantity}/10"),
          Wrap(
              alignment: WrapAlignment.start, // Alinhar itens à esquerda
              spacing: 8.0, // Espaçamento horizontal entre os itens
              runSpacing: 8.0, // Espaçamento vertical entre as linhas
              children: List.generate(
                  actualQuestionary.questionList.length,
                  (index) => GestureDetector(
                        onTap: () => Get.to(CorrectionPage(
                          question: actualQuestionary.questionList[index],
                          selectedAlternativeId:
                              actualQuestionaryResponse
                                      .answers["${index + 1}"],
                        )),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: (actualQuestionaryResponse
                                      .answers["${index + 1}"] ==
                                  actualQuestionary
                                      .questionList[index].correctAlternative)
                              ? Colors.blue
                              : Colors.red,
                          child: Center(
                            child: Text('$index'),
                          ),
                        ),
                      )))
        ],
      )),
    );
  }
}
