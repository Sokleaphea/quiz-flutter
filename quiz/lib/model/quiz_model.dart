import 'package:quiz/model/answer_model.dart';

import 'question_model.dart';

class Quiz {
  final String title;
  final List<Questions> questions;
  List<Answer> answers;
  Quiz({required this.title, required this.questions, required this.answers});

  void addAnswer(String selectedOption, Questions question) {
    answers.add(Answer(answerChoice: selectedOption, questions: question));
  }

  int getScore() {
    int totalScore = 0;
    for (Answer answer in answers) {
      if (answer.isCorrect()) {
        totalScore += answer.questions.points;
      }
    }
    return totalScore;
  }
}
