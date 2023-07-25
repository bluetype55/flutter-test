import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Michael Jackson',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  const Grade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: const Text('Introduction'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                //사진을 원모양으로 잘라서 넣는 위젯
                backgroundImage: AssetImage('assets/pngwing.com.png'),
                radius: 60,
              ),
            ),
            Divider(
              //선긋기 위젯
              height: 60, //선 위로 30 아래로 30
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30,
            ),
            const Text(
              'Name',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0, //자간 조정
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Michael Jackson',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Place of Birth',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0, //자간 조정
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Gary, Indiana, USA',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Thriller, (Most popular pop album), 1984',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Billie Jean, (Most popular pop single), 1984',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Beat It, (Most popualr Soul/R&B video), 1984',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: const AssetImage('assets/sun-6751_256.gif'),
                radius: 120,
                backgroundColor: Colors.amber[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
