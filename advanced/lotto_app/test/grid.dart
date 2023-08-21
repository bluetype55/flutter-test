import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NumberGrid(),
    );
  }
}

class NumberGrid extends StatelessWidget {
  const NumberGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Number Grid Example')),
      body: const Center(
        child: SizedBox(
          width: 150,
          height: 300,
          child: NumberGridWidget(),
        ), // 분리한 위젯 사용
      ),
    );
  }
}

class NumberGridWidget extends StatelessWidget {
  const NumberGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 45,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text('${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}
