
import 'package:fast_trivia/entities/questionary.dart';
import 'package:fast_trivia/screens/questionary_screen/components/option.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });

  final QuestionList question;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text.rich(TextSpan(
          text: "Questao ${question.id}",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black12),
          children: [
            TextSpan(
                text: "/10",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.black26))
          ])),
      const Divider(thickness: 1.5),
      const SizedBox(height: 12.0),
      Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.cyan, borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            Text('questao sobre ${question.title}'),
            Text(question.question),
            ...List.generate(question.alternativeList.length,
                (index) => Option(alternative: question.alternativeList[index]))
          ],
        ),
      )
    ]);
  }
}