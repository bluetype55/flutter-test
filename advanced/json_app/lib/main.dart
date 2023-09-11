import 'package:flutter/material.dart';
import 'package:json_app/json_parse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JsonParse(),
    );
  }
}
