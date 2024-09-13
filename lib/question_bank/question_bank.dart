import 'package:quizler/question.dart/questions.dart';

class QuestionBank{
  static List<Questions> questionsList = [
    Questions(question: "Flutter uses Dart as its programming language ?", ans: true),
    Questions(question: "Flutter apps run natively on both iOS and Android without the need for platform-specific code ?", ans: true),
    Questions(question: "In Flutter, the widget tree defines the user interface structure of an app ?", ans: true),
    Questions(question: "Flutter does not support state management techniques like Provider or Bloc ?", ans: false),
    Questions(question: "Hot reload in Flutter helps to instantly apply code changes without restarting the entire app ?", ans: true),
    Questions(question: "Flutter can only be used to develop mobile applications and does not support web or desktop applications ?", ans: false),
  ];

  static void addToList(String str, bool ans) {
    questionsList.add(Questions(question: str, ans: ans));
  }

}