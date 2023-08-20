import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lotto_app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int gameCnt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lotto game'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset('image/lotto.jpeg'),
            const SizedBox(height: 50),
            const Text(
              '게임 횟수를 선택해주세요',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: const CircleBorder(side: BorderSide.none),
                  ),
                  onPressed: () {
                    setState(() {
                      if (gameCnt > 0) {
                        gameCnt--;
                      } else {
                        gameCnt = 0;
                      }
                    });
                  },
                  child: const Icon(Icons.remove),
                ),
                SizedBox(
                  width: 100,
                  child: Center(
                    child: Text(
                      '$gameCnt',
                      style: const TextStyle(fontSize: 54),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: const CircleBorder(side: BorderSide.none),
                  ),
                  onPressed: () {
                    setState(() {
                      gameCnt++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: const Text('다음'),
            ),
          ],
        ),
      ),
    );
  }
}
