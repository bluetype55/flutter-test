import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ScaffoldMessenger',
      home: Mypage(),
    );
  }
}

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('scaffold messenger'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              onLongPress: () {
                print('text button');
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.amber,
              ),
              child: const Text(
                'Text button',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('elevated button');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.orangeAccent,
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: const Text('Elevated button'),
            ),
            OutlinedButton(
              onPressed: () {
                print('outlined button');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                // side: const BorderSide(
                //   color: Colors.black,
                // ),
              ),
              child: const Text('Outlined button'),
            ),
            TextButton.icon(
              onPressed: () {
                print('Icon button');
              },
              icon: const Icon(
                Icons.home,
                size: 30,
                // color: Colors.black87,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                print('Icon button');
              },
              icon: const Icon(
                Icons.home,
                size: 30,
                // color: Colors.black87,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black87,
                minimumSize: const Size(200, 50),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                print('Icon button');
              },
              icon: const Icon(
                Icons.home,
                size: 30,
                // color: Colors.black87,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            ),
            ElevatedButton.icon(
              onPressed: null,
              icon: const Icon(
                Icons.home,
                size: 30,
                // color: Colors.black87,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                disabledBackgroundColor: Colors.pink[50],
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: const EdgeInsets.all(50),
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Text button'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
