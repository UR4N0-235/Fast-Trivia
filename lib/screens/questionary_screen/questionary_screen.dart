// screen that you need to use to awser or view a questionary

import 'package:fast_trivia/entities/questionary.dart';
import 'package:fast_trivia/screens/questionary_screen/components/question_card.dart';
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
                child: QuestionCard(question: questionary.questionList[0]))));
  }
}
