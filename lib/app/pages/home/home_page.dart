import 'package:fast_trivia/app/controllers/questions_controller.dart';
import 'package:fast_trivia/app/pages/questionary/questionary_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// screen that show history and you can select an questionary to do.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    QuestionaryController questionaryController =
        Get.put(QuestionaryController());
    questionaryController.getResponsesFromDataBase();
    return Scaffold(
      body: Center(child: Obx(() {
        return questionaryController.questionaries.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: questionaryController.questionaries.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(questionaryController
                                  .questionaries[index].topic),
                              Text((questionaryController
                                      .isAlradyResponded(index))
                                  ? "${questionaryController.getLatestRespondedQuestionary(index)!.correctQuantity}/10"
                                  : ""),
                            ]),
                        tileColor:
                            (questionaryController.isAlradyResponded(index))
                                ? Colors.green
                                : Colors.transparent,
                        onTap: () {
                          questionaryController.changeActualQuestionary(index);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QuestionaryPage(),
                              ));
                        },
                      ),
                    ],
                  );
                });
      })),
    );
  }
}
