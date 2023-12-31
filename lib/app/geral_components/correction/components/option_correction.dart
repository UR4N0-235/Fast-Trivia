import 'package:fast_trivia/app/models/questionary_model.dart';
import 'package:flutter/material.dart';

class OptionCorrection extends StatelessWidget {
  const OptionCorrection({
    super.key,
    required this.alternative, required this.selectedAlternativeId, required this.correctAlternativeId,
  });

  final AlternativeList alternative;
  final int selectedAlternativeId;
  final int correctAlternativeId;

  @override
  Widget build(BuildContext context) {
        Color containerColor = Colors.transparent;
        if(selectedAlternativeId == alternative.id && selectedAlternativeId != correctAlternativeId) containerColor = Colors.red;
        if(alternative.id == correctAlternativeId) containerColor = Colors.green;
        
        return Container(
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: containerColor,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text(
                    alternative.text,
                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                  )),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                        color: selectedAlternativeId ==
                                alternative.id
                            ? Colors.blue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black)),
                  )
                ]),
                if(alternative.id == selectedAlternativeId) Text(alternative.reason),
          ],)
        );
  }
}
