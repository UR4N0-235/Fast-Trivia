// To parse this JSON data, do
//
//     final questionary = questionaryFromJson(jsonString);

import 'dart:convert';

List<Questionary> questionaryFromJson(String str) => List<Questionary>.from(json.decode(str).map((x) => Questionary.fromJson(x)));

String questionaryToJson(List<Questionary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Questionary {
    String topic;
    String description;
    List<QuestionList> questionList;

    Questionary({
        required this.topic,
        required this.description,
        required this.questionList,
    });

    factory Questionary.fromJson(Map<String, dynamic> json) => Questionary(
        topic: json["topic"],
        description: json["description"],
        questionList: List<QuestionList>.from(json["question_list"].map((x) => QuestionList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "topic": topic,
        "description": description,
        "question_list": List<dynamic>.from(questionList.map((x) => x.toJson())),
    };
}

class QuestionList {
    int id;
    String title;
    String question;
    int correctAlternative;
    List<AlternativeList> alternativeList;

    QuestionList({
        required this.id,
        required this.title,
        required this.question,
        required this.correctAlternative,
        required this.alternativeList,
    });

    factory QuestionList.fromJson(Map<String, dynamic> json) => QuestionList(
        id: json["id"],
        title: json["title"],
        question: json["question"],
        correctAlternative: json["correct_alternative"],
        alternativeList: List<AlternativeList>.from(json["alternative_list"].map((x) => AlternativeList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "question": question,
        "correct_alternative": correctAlternative,
        "alternative_list": List<dynamic>.from(alternativeList.map((x) => x.toJson())),
    };
}

class AlternativeList {
    int id;
    String text;
    String reason;

    AlternativeList({
        required this.id,
        required this.text,
        required this.reason,
    });

    factory AlternativeList.fromJson(Map<String, dynamic> json) => AlternativeList(
        id: json["id"],
        text: json["text"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "reason": reason,
    };
}
