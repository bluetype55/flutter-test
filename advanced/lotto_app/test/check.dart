import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckboxListTileExample(),
    );
  }
}

class CheckboxListTileExample extends StatefulWidget {
  const CheckboxListTileExample({super.key});

  @override
  _CheckboxListTileExampleState createState() =>
      _CheckboxListTileExampleState();
}

class _CheckboxListTileExampleState extends State<CheckboxListTileExample> {
  final List<bool?> _isCheckedList = [false, false, false]; // 각 항목의 체크 상태 저장

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CheckboxListTile Example')),
      body: ListView.builder(
        itemCount: 3, // 예시를 위해 3개의 항목 생성
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text('Item ${index + 1}'),
            value: _isCheckedList[index],
            onChanged: (bool? newValue) {
              setState(() {
                _isCheckedList[index] = newValue;
              });
            },
          );
        },
      ),
    );
  }
}
