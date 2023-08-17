import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  const Answer({required this.answer, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(40),
      child: Text(
        answer,
        style: const TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
