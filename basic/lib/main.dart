import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Callback',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter's Callback"),
          centerTitle: true,
          elevation: 0,
        ),
        body: const Body(),
      ),
    ),
  );
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const TestWidget();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Count : $value',
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 8,
          ),
          TestButton(addCounter),
        ],
      ),
    );
  }

  void addCounter(int addValue) => setState(() => value = addValue + value);
}

class TestButton extends StatelessWidget {
  const TestButton(this.callback, {super.key});

  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback.call(1),
      onDoubleTap: () => callback.call(5),
      onLongPress: () => callback.call(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: const Text(
          'Up Counter',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
