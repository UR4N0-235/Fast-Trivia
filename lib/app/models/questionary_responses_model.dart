// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

List<QuestionaryResponse> responseFromJson(String str) =>
    List<QuestionaryResponse>.from(
        json.decode(str).map((x) => QuestionaryResponse.fromJson(x)));

String responseToJson(List<QuestionaryResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionaryResponse {
  int questionaryId;
  DateTime? timestamp;
  Map<String, dynamic> answers;

  QuestionaryResponse({
    required this.questionaryId,
    timestamp,
    required this.answers,
  });

  factory QuestionaryResponse.fromJson(Map<String, dynamic> json) {
    return QuestionaryResponse(
      questionaryId: json["questionary_id"],
      timestamp: json.containsKey("timestamp")
          ? DateTime.parse(json["timestamp"])
          : null,
      answers: jsonDecode(json["answers"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "questionary_id": questionaryId,
        "timestamp": timestamp,
        "answers":
            Map.from(answers).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
