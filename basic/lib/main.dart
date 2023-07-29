import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Builder(builder: (context) {
          return ElevatedButton(
            child: const Text('Go to ScreenA'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenA(),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen A'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 스크린 A에서 스크린 B로 이동하는 코드 예시
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenB(),
              ),
            );
          },
          child: const Text('Go to ScreenB'),
        ),
      ),
    );
  }
}

class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen B'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 스크린 B에서 이전 화면으로 돌아가는 코드 예시
            Navigator.pop(context);
          },
          child: const Text('Go back'),
        ),
      ),
    );
  }
}
