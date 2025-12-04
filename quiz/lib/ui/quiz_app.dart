import 'package:flutter/material.dart';
// import 'package:quiz/main.dart';
import 'package:quiz/model/question_model.dart';
import './screen/start_screen.dart';
import './screen/questions_screen.dart';
import '../data/question_data.dart';
import './screen/result_screen.dart';

enum ScreenState { start, question, finish }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  ScreenState currentState = ScreenState.start;
  int score = 0;
  int totalScore = 0;
  List<String?> selectedAnswers = List.filled(questionList.length, null);
  List<Questions> questions = questionList;

  void selectAnswer(String option, int questionIndex) {
    selectedAnswers[questionIndex] = option;
    if (option == questions[questionIndex].correctAnswer) {
      score++;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (currentState) {
      case ScreenState.start:
        return StartScreen(
          onStart: () {
            setState(() {
              currentState = ScreenState.question;
            });
          },
        );
      case ScreenState.question:
        return QuestionScreen(
          onSelectAnswer: selectAnswer,
          onFinish: () {
            setState(() {
              currentState = ScreenState.finish;
            });
          },
          questions: questions,
          score: score,
        );
      case ScreenState.finish:
        return ResultScreen(
          selectedAnswers: selectedAnswers,
          questions: questions,
          score: score,
          onBack: () {
            setState(() {
              currentState = ScreenState.start;
            });
          },
        );
    }
  }
}

void main() {
  runApp(const MaterialApp(home: QuizApp()));
}
