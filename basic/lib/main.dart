import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'toast',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast message'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
