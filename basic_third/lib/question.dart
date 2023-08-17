import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  const Question({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: Text(
          question,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }
}
