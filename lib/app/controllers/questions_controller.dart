import 'package:fast_trivia/app/models/questionary_model.dart';
import 'package:fast_trivia/app/pages/score/score_page.dart';
import 'package:fast_trivia/app/utils/http_request_mocked.dart';
import 'package:get/get.dart';

class QuestionaryController extends GetxController {
  final RxList<Questionary> _questionaries = <Questionary>[].obs;
  List<Questionary> get questionaries => _questionaries;

  Questionary? _actualQuestionary;
  Questionary get actualQuestionary => _actualQuestionary!;

  final RxInt _actualQuestion = 0.obs;
  int get actualQuestion => _actualQuestion.value;

  // bool _isAnswered = false;
  // bool get isAnswered => _isAnswered;

  // int _correctAns;
  // int get correctAns => _correctAns;

  final RxInt _selectedAlternativeId = 0.obs;
  int get selectedAlternativeId => _selectedAlternativeId.value;

  final Map<int, int> _responses = <int, int>{};
  Map<int, int> get responses => _responses;

  // // for more about obs please check documentation
  // final RxInt _questionNumber = 1.obs;
  // RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    HttpRequestMocked.loadJsonData().then((value) {
      _questionaries.value = questionaryFromJson(value);
    });
    super.onInit();
  }

  // // // called just before the Controller is deleted from memory
  // @override
  // void onClose() {
  //   super.onClose();
  // }

  changeActualQuestionary(int questionaryIndex) =>
      _actualQuestionary = _questionaries[questionaryIndex];
  changeSelectedAswerId(int id) => _selectedAlternativeId.value = id;
  changeActualQuestion(int index) => _actualQuestion.value = index;

  void checkAns(int selectedIndex) {
    int correctAns = actualQuestionary
        .questionList[_actualQuestion.value].correctAlternative;
    int selectedAns = selectedIndex;

    if (correctAns == selectedAns) _numOfCorrectAns++;
  }

  void nextQuestion() {
    if (_actualQuestion.value + 1 != actualQuestionary.questionList.length) {
      _responses[_actualQuestionary!.questionList[actualQuestion].id] =
          selectedAlternativeId;
      _actualQuestion.value++;
      _selectedAlternativeId.value = 0;
      update();
    } else {
      Get.to(() => const ScorePage());
    }
  }

  bool isLatesteQuestion(){
    return _actualQuestion.value + 1 == actualQuestionary.questionList.length;
  }

  reset() {
    changeSelectedAswerId(0);
    changeActualQuestion(0);
  }

  // void updateTheQnNum(int index) {
  //   _questionNumber.value = index + 1;
  // }
}
