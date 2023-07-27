import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar',
      home: const MyPage(),
      theme: ThemeData(primarySwatch: Colors.red),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack Bar'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const MySnackBar(),
    );
  }
}

class MySnackBar extends StatelessWidget {
  const MySnackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final SnackBar snackBar = SnackBar(
            content: const Text(
              'Yay! A SnackBar!',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.teal,
            duration: const Duration(milliseconds: 3000),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.red),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
        ),
        child: const Text(
          'show me',
        ),
      ),
    );
  }
}
