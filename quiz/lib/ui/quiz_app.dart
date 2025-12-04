import 'package:flutter/material.dart';
import 'package:quiz/data/question_data.dart';
import 'package:quiz/model/answer_model.dart';
// import 'package:quiz/main.dart';
import 'package:quiz/model/quiz_model.dart';
import 'package:quiz/ui/screen/start_screen.dart';
// import './screen/start_screen.dart';
import './screen/questions_screen.dart';
// import '../data/question_data.dart';
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
  // int totalScore = 0;
  // List<String?> selectedAnswers = List.filled(questionList.length, null);
  // List<Questions> questions = questionList;
  late Quiz quiz;
  @override
    void initState() {
      super.initState();
      quiz = Quiz(title: "Quiz", questions: questionList, answers: []);
    }
  int currentQuestion = 0;
  void selectAnswer(String option, int questionIndex) {
    setState(() {
      quiz.answers[questionIndex] = Answer(
        answerChoice: option,
        questions: quiz.questions[questionIndex],
      );
    });
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
          quiz: quiz,
          onFinish: () {
            setState(() {
              currentState = ScreenState.finish;
            });
          },
        );
      case ScreenState.finish:
        return ResultScreen(
          quiz: quiz,
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
