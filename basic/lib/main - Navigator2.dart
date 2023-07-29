import 'package:basic/screen_A.dart';
import 'package:basic/screen_b.dart';
import 'package:basic/screen_c.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: '/',
      routes: {
        '/': (context) => const ScreenA(),
        '/b': (context) => const ScreenB(),
        '/c': (context) => const ScreenC(),
      },
    );
  }
}
