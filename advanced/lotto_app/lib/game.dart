import 'package:flutter/material.dart';
import 'package:lotto_app/inspection.dart';
import 'package:lotto_app/widget/lotto_paper.dart';

class Game extends StatefulWidget {
  final List<int> lottoNum;
  final int gameCnt;

  const Game({required this.gameCnt, required this.lottoNum, super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late List<List<List<int>>> dataListFromChild;
  late List<List<bool>> autoCheckedList;
  @override
  void initState() {
    super.initState();

    dataListFromChild =
        List.generate(widget.gameCnt, (_) => [[], [], [], [], []]);
    autoCheckedList = List.generate(
        widget.gameCnt, (_) => [false, false, false, false, false]);
  }

  // 콜백 함수를 통해 자식 위젯의 데이터 업데이트
  void updateChildData(
      int index, List<List<int>> newData, List<bool> newAutoChecked) {
    setState(() {
      dataListFromChild[index] = newData;
      autoCheckedList[index] = newAutoChecked;
      debugPrint('$dataListFromChild');
      debugPrint('$autoCheckedList');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('select numbers'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'image/lotto2.jpg',
              ),
              Column(
                children: List.generate(
                    widget.gameCnt,
                    (index) =>
                        LottoPaper(index: index, callback: updateChildData)),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 75, vertical: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        shape: const CircleBorder(eccentricity: 0.0),
                        fixedSize: const Size(100, 100),
                      ),
                      onPressed: () {
                        for (int index = 0;
                            index < dataListFromChild.length;
                            index++) {
                          var lottoPaper = dataListFromChild[index];
                          for (var i = 0; i < lottoPaper.length; i++) {
                            if (lottoPaper[i].length < 6) {
                              autoCheckedList[index][i] = true;
                            }
                          }
                        }
                        List<List<String>> autoStringList = List.generate(
                            widget.gameCnt, (index) => ['', '', '', '', '']);

                        for (var gameIdx = 0;
                            gameIdx < widget.gameCnt;
                            gameIdx++) {
                          for (var i = 0;
                              i < dataListFromChild[gameIdx].length;
                              i++) {
                            if (dataListFromChild[gameIdx][i].isEmpty &&
                                autoCheckedList[gameIdx][i]) {
                              autoStringList[gameIdx][i] = '자      동';
                            } else if (dataListFromChild[gameIdx][i]
                                    .isNotEmpty &&
                                !autoCheckedList[gameIdx][i]) {
                              autoStringList[gameIdx][i] = '수      동';
                            } else {
                              autoStringList[gameIdx][i] = '반 자 동';
                            }
                          }
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Inspection(
                                      lottoNum: widget.lottoNum,
                                      myNum: dataListFromChild,
                                      autoStringList: autoStringList,
                                    )));
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 50,
                      ),
                    ),
                  ),
                  const Text('복권 발행'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
