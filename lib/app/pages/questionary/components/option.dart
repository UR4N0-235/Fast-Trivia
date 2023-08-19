import 'package:fast_trivia/app/models/questionary_model.dart';
import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.alternative,
  });

  final AlternativeList alternative;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(
          alternative.text,
          style: const TextStyle(color: Colors.black87, fontSize: 16),
        ),
        Container(
          height: 26,
          width: 26,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black)),
        )
      ]),
    );
  }
}
