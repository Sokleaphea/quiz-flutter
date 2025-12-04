import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;


  const AnswerButton({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTap, 
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          backgroundColor: selected ? Colors.green : Colors.white,
          foregroundColor: selected ? Colors.white : Colors.black,
        ),
        child: SizedBox(
          width: 400,
          height: 50,
          child: Center(
            child: Text(text),
          )
        ),
      ),
    );
  }
}