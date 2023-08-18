import 'package:flutter/material.dart';

// screen that show history and you can select an questionary to do.
class LatestQuestionary extends StatefulWidget {
  const LatestQuestionary({super.key});

  @override
  State<StatefulWidget> createState() => _LatestQuestionary();
}

class _LatestQuestionary extends State<LatestQuestionary> {
  @override
  Widget build(BuildContext context) {
    return const Text("Latest");
  }
}
