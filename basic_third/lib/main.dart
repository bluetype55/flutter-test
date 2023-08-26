import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Future',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result = 'no data found';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future test'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  futureTest();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Future test',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                result,
                style: const TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
              const Divider(
                height: 20,
                thickness: 2,
              ),
              FutureBuilder(
                future: myFuture(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // 로딩 중인 경우
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}'); // 오류 발생한 경우
                  } else if (snapshot.hasData) {
                    final data = snapshot.data;
                    if (data != null) {
                      return Text(
                        data,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.blue),
                      );
                    } else {
                      return const Text('Data is null'); // 데이터가 null인 경우 처리
                    } // 데이터를 받아온 경우
                  } else {
                    return const Text('No data'); // 데이터가 없는 경우
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> futureTest() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      print('Here comes second');
      setState(() {
        result = 'the data is fetched';
        print(result);
        print('Here comes third');
      });
    });
    print('Here comes first');
    print('Here comes last one');
  }

  Future<String> myFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'another Future completed';
  }
}
