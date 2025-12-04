import 'package:flutter/material.dart';
import 'package:quiz/model/quiz_model.dart';
import '../widget/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  // final List<Questions> questions;
  // final Function(String, int) onSelectAnswer;
  final Quiz quiz;
  final VoidCallback onFinish;
  const QuestionScreen({super.key, required this.onFinish, required this.quiz});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;
  String? selectedOption;

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  void nextQuestion() {
    final question = widget.quiz.questions[questionIndex];
    widget.quiz.addAnswer(selectedOption!, question);
    // if (selectedOption == question.correctAnswer) {
    //   score++;
    //   print("$score");
    // }
    if (questionIndex == widget.quiz.questions.length - 1) {
      widget.onFinish();
      return;
    }

    setState(() {
      questionIndex++;
      selectedOption = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.quiz.questions[questionIndex];
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                question.text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              ...question.options.map(
                (opt) => AnswerButton(
                  text: opt,
                  selected: selectedOption == opt,
                  onTap: () {
                    setState(() {
                      selectedOption = opt;
                    });
                    // widget.onSelectAnswer(opt, questionIndex);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: selectedOption == null ? null : nextQuestion,
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
