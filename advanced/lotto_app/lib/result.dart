import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lotto_app/main.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue[50],
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '로또 6/45  ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '제1007회',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text('2021-02-06 추첨'),
            const SizedBox(height: 15),
            const Text('당첨번호', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: List.generate(
                      6,
                      (index) => const NumberBall(
                            num: 10,
                            ballColor: Colors.red,
                            textColor: Colors.white,
                          )),
                ),
                const Row(
                  children: [
                    Icon(Icons.add),
                    NumberBall(
                        num: 20,
                        ballColor: Colors.blue,
                        textColor: Colors.white)
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            WinningMsg(winning: true, ranking: 1),
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 25, left: 15, right: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: 1, color: Colors.grey.shade300))),
                  child: Column(
                    children: [
                      Column(
                        children:
                            List.generate(5, (index) => Record(index: index)),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        '※ QR당첨확인은 보조 확인수단이므로 반드시 실물과 대조하시기 바라며, 당첨금은 실물 복권소지자에게 지급합니다.',
                        style: TextStyle(fontSize: 11),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ),
                          );
                        },
                        child: const Text('처음으로'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Record extends StatelessWidget {
  final int index;
  const Record({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> alphbet = ['A', 'B', 'C', 'D', 'E'];
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(
                left: BorderSide(width: 1, color: Colors.grey.shade400),
                right: BorderSide(width: 1, color: Colors.grey.shade400),
                bottom: BorderSide(width: 1, color: Colors.grey.shade400),
              ),
            ),
            child: Center(
                child: Text(
              alphbet[index],
              style: const TextStyle(
                  fontFamily: 'RobotoMono', fontWeight: FontWeight.bold),
            )),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1, color: Colors.grey.shade400),
                bottom: BorderSide(width: 1, color: Colors.grey.shade400),
              ),
            ),
            child: const Center(child: Text('낙첨')),
          ),
        ),
        Expanded(
          flex: 12,
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1, color: Colors.grey.shade400),
                bottom: BorderSide(width: 1, color: Colors.grey.shade400),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => const NumberBall(
                  num: 10,
                  ballColor: Colors.white,
                  textColor: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WinningMsg extends StatelessWidget {
  final bool winning;
  final int ranking;
  final List<String> winnings = [
    '2,343,892,944원',
    '46,708,012원',
    '1,470,112원',
    '50,000원',
    '5,000원'
  ];
  final List<String> lostMsg = ['아쉽게도,', '낙첨되었습니다.', '', ''];
  final List<String> winMsg = ['축하합니다!', '총 ', '5,000원', ' 당첨'];
  WinningMsg({
    required this.winning,
    required this.ranking,
    super.key,
  });

  @override
  @SemanticsHintOverrides()
  Widget build(BuildContext context) {
    winMsg[2] = winning ? winnings[ranking - 1] : '';
    List<String> msg = winning ? winMsg : lostMsg;
    return Container(
      width: 330,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // 그림자 색상
            spreadRadius: 1, // 그림자 확산 정도
            blurRadius: 1, // 그림자 흐림 정도
            offset: const Offset(2, 3), // 그림자 위치 (x, y)
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            msg[0],
            style: TextStyle(color: Colors.grey[700], fontSize: 13),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(msg[1], style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                msg[2],
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              Text(msg[3], style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class NumberBall extends StatelessWidget {
  final int num;
  final Color ballColor;
  final Color textColor;
  const NumberBall({
    required this.num,
    required this.ballColor,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(color: ballColor, shape: BoxShape.circle),
        child: Center(
          child: Text(
            '$num',
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
