import 'package:fast_trivia/app/models/questionary_model.dart';
import 'package:fast_trivia/app/geral_components/correction/components/option_correction.dart';
import 'package:flutter/material.dart';

// screen that show history and you can select an questionary to do.
class CorrectionPage extends StatelessWidget {
  const CorrectionPage(
      {super.key, required this.question, required this.selectedAlternativeId});
  final QuestionList question;
  final int? selectedAlternativeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("score page")),
        body: Center(
          child: Column(
            children: [
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
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Text('questao sobre ${question.title}'),
                    Text(question.question),
                    ...List.generate(
                        question.alternativeList.length,
                        (index) => OptionCorrection(
                            alternative: question.alternativeList[index],
                            selectedAlternativeId: selectedAlternativeId!,
                            correctAlternativeId: question.correctAlternative,
                            ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
