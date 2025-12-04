import 'package:flutter/material.dart';
// import 'package:quiz/model/question_model.dart';
// import './ui/screen/start_screen.dart';
// import './ui/screen/questions_screen.dart';
// import './data/question_data.dart';
// import './ui/screen/result_screen.dart';
import './ui/quiz_app.dart';

// enum ScreenState { start, question, finish }

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   // bool next = true;
//   ScreenState currentState = ScreenState.start;
//   int score = 0;
//   int totalScore = 0;
//   List<String?> selectedAnswers = List.filled(questionList.length, null);
//   List<Questions> questions = questionList;

//   void selectAnswer(String option, int questionIndex) {
//     selectedAnswers[questionIndex] = option;
//     if (option == questions[questionIndex].correctAnswer) {
//       score++;
//     }
//   }
//   // void switchPage() {
//   //   setState(() {
//   //     next = !next;
//   //   });
//   // }

//   // void nextQues() {
//   //   setState(() {
//   //     next = false;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     switch (currentState) {
//       case ScreenState.start:
//         return StartScreen(
//           onStart: () {
//             setState(() {
//               currentState = ScreenState.question;
//             });
//           },
//         );
//       case ScreenState.question:
//         return QuestionScreen(
//           onSelectAnswer: selectAnswer,
//           onFinish: () {
//             setState(() {
//               currentState = ScreenState.finish;
//             });
//           },
//           questions: questions,
//           score: score,
//         );
//       case ScreenState.finish:
//         return ResultScreen(
//           selectedAnswers: selectedAnswers,
//           questions: questions,
//           score: score,
//           onBack: () {
//             setState(() {
//               currentState = ScreenState.start;
//             });
//           },
//         );
//     }
//   }
// }

void main() {
  runApp(const MaterialApp(home: QuizApp()));
}

// return MaterialApp(
    //   home: Scaffold(
    //     backgroundColor: Colors.blue,
    //     body: Container(
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //           colors: [Colors.blue, Color(0xff00BCDC)],
    //           begin: Alignment.topLeft,
    //           end: Alignment.bottomRight,
    //         ),
    //       ),
    // child: next
    //     ? StartScreen(onStart: switchPage)
    //     : QuestionScreen(
    //         onFinish: nextQues,
    //         questions: questions,
    //         score: score,
    //       ),
    //     ),
    //   ),
    // );
