import 'dart:convert';

import 'package:fast_trivia/app/models/questionary_model.dart';
import 'package:fast_trivia/app/models/questionary_responses_model.dart';
import 'package:fast_trivia/app/pages/score/score_page.dart';
import 'package:fast_trivia/app/utils/http_request_mocked.dart';
import 'package:fast_trivia/db/database_helper.dart';
import 'package:get/get.dart';

class QuestionaryController extends GetxController {
  final RxList<Questionary> _questionaries = <Questionary>[].obs;
  List<Questionary> get questionaries => _questionaries;

  Questionary? _actualQuestionary;
  Questionary get actualQuestionary => _actualQuestionary!;

  final RxInt _actualQuestion = 0.obs;
  int get actualQuestion => _actualQuestion.value;

  final RxInt _selectedAlternativeId = 0.obs;
  int get selectedAlternativeId => _selectedAlternativeId.value;

  final Map<int, int> _responses = <int, int>{};
  Map<int, int> get responses => _responses;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  final List<bool> _alternativeCorrection = [];
  List<bool> get alternativeCorrection => _alternativeCorrection;

  List<QuestionaryResponse>? _responsesList;
  List<QuestionaryResponse> get responsesList => _responsesList!;

  @override
  void onInit() {
    HttpRequestMocked.loadJsonData().then((value) {
      _questionaries.value = questionaryFromJson(value);
    });
    super.onInit();
  }

  changeActualQuestionary(int index) =>
      _actualQuestionary = _questionaries[index];
  changeSelectedAswerId(int index) => _selectedAlternativeId.value = index;

  void nextQuestion() {
    _responses[_actualQuestion.value + 1] = _selectedAlternativeId.value;
    _selectedAlternativeId.value = 0;

    if (isLatesteQuestion()) {
      checkAllAswers();
      Get.to(() => const ScorePage());
      update();
    }
  }

  updateQuestionNumber() {
    _actualQuestion.value++;
  }

  bool isLatesteQuestion() {
    return _actualQuestion.value == actualQuestionary.questionList.length - 1;
  }

  reset() {
    _selectedAlternativeId.value = 0;
    _actualQuestion.value = 0;
    _numOfCorrectAns = 0;
  }

  QuestionList getActualQuestion() {
    return _actualQuestionary!.questionList[_actualQuestion.value];
  }

  checkAllAswers() {
    for (int i = 0; i < _responses.length; i++) {
      if (_responses[i + 1] ==
          actualQuestionary.questionList[i].correctAlternative.toInt()) {
        _alternativeCorrection.add(true);
        _numOfCorrectAns++;
      } else {
        _alternativeCorrection.add(false);
      }
    }
    saveResponses();
  }

  saveResponses() async {
    Map<String, dynamic> serializableMap = {};
    _responses.forEach((key, value) {
      serializableMap[key.toString()] = value;
    });
    String responsesToJson = json.encode(serializableMap);
    await DatabaseHelper.instance.insertResponse(
        _actualQuestionary!.id, _numOfCorrectAns, responsesToJson);
  }

  Future getResponsesFromDataBase() async {
    String json = await DatabaseHelper.instance.getAllResponsesAsJson();
    _responsesList = responseFromJson(json);
  }

  bool isAlradyResponded(int index) {
    int realValueOfId = index + 1;
    if (_responsesList != null) {
      for (int i = 0; i < _responsesList!.length; i++) {
        if (_responsesList![i].questionaryId == realValueOfId) return true;
      }
    }
    return false;
  }

  QuestionaryResponse? getLatestRespondedQuestionary(int index) {
    if (!isAlradyResponded(index)) return null;
    int realValueOfId = index + 1;
    QuestionaryResponse? result;
    
    for (int i = 0; i < _responsesList!.length; i++) {
      if (_responsesList![i].questionaryId == realValueOfId) result = _responsesList![i];
    }
    return result;
  }
}
