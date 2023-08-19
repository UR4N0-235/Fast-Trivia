// screen that you need to use to awser or view a questionary

import 'package:fast_trivia/app/pages/questionary/components/question_card.dart';
import 'package:fast_trivia/app/models/questionary_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionaryScreen extends StatefulWidget {
  final Questionary questionary;

  const QuestionaryScreen({super.key, required this.questionary});

  @override
  State<StatefulWidget> createState() => _QuestionaryScreen();
}

class _QuestionaryScreen extends State<QuestionaryScreen> {
  late Questionary questionary;

  @override
  void initState() {
    questionary = widget.questionary;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Questionario sobre ${questionary.topic}'),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Expanded(
                    child: PageView.builder(
                        itemBuilder: (context, index) => QuestionCard(
                            question: questionary.questionList[0]))))));
  }
}
