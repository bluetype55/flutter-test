import 'package:basic_third/answer.dart';
import 'package:basic_third/question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var survey = [
    {
      '질문': '좋아하는 음식은?',
      '답변': ['김치찌개', '불고기', '비빔국수'],
    },
    {
      '질문': '좋아하는 색상은?',
      '답변': ['파랑', '빨강', '노랑'],
    },
    {
      '질문': '좋아하는 캐릭터는?',
      '답변': ['아이언맨', '배트맨', '스파이더맨'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Const & Final',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('const & final'),
        ),
        body: const Question(question: '좋아하는 음식은?'),
      ),
    );
  }
}
