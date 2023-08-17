import 'package:flutter/material.dart';
import 'package:login_app/login_app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase login app',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const LogIn(),
    );
  }
}
