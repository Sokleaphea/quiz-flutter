import 'package:flutter/material.dart';
import '../../model/quiz_model.dart';
// import '../widget/answer_button.dart';

class ResultScreen extends StatelessWidget {
  // final int score;
  // final List<Questions> questions;
  // final List<String?> selectedAnswers;
  final Quiz quiz;
  final VoidCallback onBack;
  const ResultScreen({super.key, required this.quiz, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text("Your Score: ${quiz.getScore()}"),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final answer = quiz.answers[index];
                  final userAnswer = answer.answerChoice;
                  final correctAnswer = question.correctAnswer;
                  // final options = question.options;
                  return Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            question.text,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [ 
                              ...question.options.map((option) {
                                if (option == correctAnswer) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.check),
                                          const SizedBox(width: 10),
                                          Text(
                                            option,
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }

                                if (option == userAnswer &&
                                    userAnswer != correctAnswer) {
                                  return Text(
                                    option,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                                return Text(
                                  option,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                  // );
                },
              ),
            ),
          ),
          ElevatedButton(onPressed: onBack, child: Text("Restart Quiz")),
        ],
      ),
    );
  }
}
