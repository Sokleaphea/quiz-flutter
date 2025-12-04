import 'package:quiz/model/question_model.dart';

class Answer {
  final String answerChoice;
  Questions questions;

  Answer({
    required this.answerChoice,
    required this.questions
  });

  bool isCorrect() {
    return answerChoice == questions.correctAnswer;
  }
}
