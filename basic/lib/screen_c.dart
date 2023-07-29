import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenC'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ScreenC',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
