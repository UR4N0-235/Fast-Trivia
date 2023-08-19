import 'package:fast_trivia/entities/questionary.dart';
import 'package:fast_trivia/screens/questionary_screen/questionary_screen.dart';
import 'package:fast_trivia/util/http_request_mocked.dart';
import 'package:flutter/material.dart';

// screen that show history and you can select an questionary to do.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  late List<Questionary> questionaryList;

  @override
  void initState() {
    questionaryList = [];
    HttpRequestMocked.loadJsonData().then((value) {
      setState(() {
        questionaryList = questionaryFromJson(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: questionaryList.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: questionaryList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(questionaryList[index].topic),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionaryScreen(
                                    questionary: questionaryList[index]),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  })),
    );
  }
}
