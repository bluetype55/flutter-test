import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class Result extends StatelessWidget {
  final List<int> lottoNum;
  final List<List<int>> myNum;
  const Result({
    required this.lottoNum,
    required this.myNum,
    super.key,
  });

  String rank(List<int> myNum, List<int> lottoNum) {
    int hits = 0;
    for (var i = 0; i < lottoNum.length - 1; i++) {
      if (lottoNum.sublist(0, 6).contains(myNum[i])) {
        hits++;
      }
    }
    if (hits == 6) {
      return '1등당첨';
    } else if (hits == 5 && myNum.contains(lottoNum[lottoNum.length - 1])) {
      return '2등당첨';
    } else if (hits == 5) {
      return '3등당첨';
    } else if (hits == 4) {
      return '4등당첨';
    } else if (hits == 3) {
      return '5등당첨';
    }
    return '낙첨';
  }

  String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now().toLocal();
    List<String> totalRanking = ['', '', '', '', ''];
    for (var i = 0; i < totalRanking.length; i++) {
      totalRanking[i] = rank(myNum[i], lottoNum);
    }
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
            Text(
                '${now.year}-${_formatNumber(now.month)}-${_formatNumber(now.day)} 추첨'),
            const SizedBox(height: 15),
            const Text('당첨번호', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: List.generate(
                      6,
                      (index) => NumberBall(
                            num: lottoNum[index],
                            ballColor: lottoNumberBallColor(lottoNum[index]),
                            textColor: Colors.white,
                          )),
                ),
                Row(
                  children: [
                    const Icon(Icons.add),
                    NumberBall(
                        num: lottoNum[6],
                        ballColor: lottoNumberBallColor(lottoNum[6]),
                        textColor: Colors.white)
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            WinningMsg(
              totalRanking: totalRanking,
            ),
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
                        children: List.generate(
                            myNum.length,
                            (index) => Record(
                                  ranking: rank(myNum[index], lottoNum),
                                  index: index,
                                  myNum: myNum[index],
                                  lottoNum: lottoNum,
                                )),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        '※ QR당첨확인은 보조 확인수단이므로 반드시 실물과 대조하시기 바라며, 당첨금은 실물 복권소지자에게 지급합니다.',
                        style: TextStyle(fontSize: 11),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.popUntil(context, ModalRoute.withName('/'));
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

Color lottoNumberBallColor(int number) {
  if (0 < number && number < 10) {
    return Colors.orangeAccent;
  } else if (10 <= number && number < 20) {
    return const Color.fromARGB(255, 68, 174, 245);
  } else if (20 <= number && number < 30) {
    return Colors.redAccent;
  } else if (30 <= number && number < 40) {
    return Colors.grey;
  } else {
    return Colors.lightGreen;
  }
}

class Record extends StatelessWidget {
  final int index;
  final List<int> myNum;
  final List<int> lottoNum;
  final String ranking;
  const Record({
    required this.index,
    required this.ranking,
    required this.lottoNum,
    required this.myNum,
    super.key,
  });

  NumberBall makeNumberBall(int num) {
    if (lottoNum.sublist(0, 6).contains(num)) {
      return NumberBall(
        num: num,
        ballColor: lottoNumberBallColor(num),
        textColor: Colors.white,
      );
    } else {
      return NumberBall(
        num: num,
        ballColor: Colors.white,
        textColor: Colors.black,
      );
    }
  }

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
            child: Center(child: Text(ranking)),
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
                myNum.length,
                (index) => makeNumberBall(myNum[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WinningMsg extends StatelessWidget {
  final List<String> totalRanking;
  final List<int> winningsList = [2343892944, 46708012, 1470112, 50000, 5000];
  final List<String> lostMsg = ['아쉽게도,', '낙첨되었습니다.', '', ''];
  final List<String> winMsg = ['축하합니다!', '총 ', '', ' 당첨'];
  WinningMsg({
    required this.totalRanking,
    super.key,
  });

  int winCalc(List<String> totalRanking) {
    int winnings = 0;
    for (var i = 0; i < totalRanking.length; i++) {
      if (totalRanking[i] == '1등당첨') {
        winnings += winningsList[0];
      }
      if (totalRanking[i] == '2등당첨') {
        winnings += winningsList[1];
      }
      if (totalRanking[i] == '3등당첨') {
        winnings += winningsList[2];
      }
      if (totalRanking[i] == '4등당첨') {
        winnings += winningsList[3];
      }
      if (totalRanking[i] == '5등당첨') {
        winnings += winningsList[4];
      }
      if (totalRanking[i] == '낙첨') {
        winnings += 0;
      }
    }
    return winnings;
  }

  @override
  @SemanticsHintOverrides()
  Widget build(BuildContext context) {
    bool isWin = false;
    int winnings = 0;
    NumberFormat numberFormat = NumberFormat('#,###');
    winnings = winCalc(totalRanking);
    if (winnings != 0) {
      isWin = true;
    }
    winMsg[2] = isWin ? '${numberFormat.format(winnings)}원' : '';
    List<String> msg = isWin ? winMsg : lostMsg;
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
