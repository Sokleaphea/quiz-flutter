class Questions {
  final String text;
  final List<String> options;
  final String correctAnswer;
  int points;

  Questions({
    required this.text,
    required this.options,
    required this.correctAnswer,
    required this.points,
  });
}
