import 'package:fast_trivia/app/controllers/questions_controller.dart';
import 'package:fast_trivia/app/models/questionary_model.dart';
import 'package:fast_trivia/app/pages/history/components/score_history_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionaryController questionaryController =
        Get.put(QuestionaryController());
    return Scaffold(
        body: Center(
      child: ListView.builder(
          itemCount: questionaryController.responsesList.length,
          itemBuilder: (context, index) {
            index = questionaryController.responsesList.length - index -1;
            Questionary actualQuestionary = questionaryController.questionaries[
                questionaryController.responsesList[index].questionaryId - 1];
            return Column(
              children: [
                ListTile(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(actualQuestionary.topic),
                        Text(
                            "${questionaryController.responsesList[index].correctQuantity}/10"),
                      ]),
                  subtitle: Text(DateFormat('dd/MM/yyyy - HH:mm').format(
                      questionaryController.responsesList[index].timestamp!)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryScore(
                            actualQuestionaryResponse:
                                questionaryController.responsesList[index],
                          ),
                        ));
                  },
                ),
              ],
            );
          }),
    ));
  }
}
