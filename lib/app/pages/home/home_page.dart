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
  // late List<Questionary> questionaryList;

  @override
  void initState() {
    // questionaryList = [];
    // HttpRequestMocked.loadJsonData().then((value) {
    //   setState(() {
    //     questionaryList = questionaryFromJson(value);
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuestionaryController questionaryController =
        Get.put(QuestionaryController());
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
                        title: Text(
                            questionaryController.questionaries[index].topic),
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
