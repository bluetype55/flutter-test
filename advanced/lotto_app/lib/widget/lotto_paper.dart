import 'package:flutter/material.dart';
import 'package:lotto_app/widget/lotto_check.dart';

class LottoPaper extends StatefulWidget {
  final Function(int index, List<List<int>>, List<bool>) callback;
  final int index;
  const LottoPaper({
    required this.index,
    required this.callback,
    super.key,
  });

  @override
  State<LottoPaper> createState() => _LottoPaperState();
}

class _LottoPaperState extends State<LottoPaper> {
  List<List<int>> dataListFromChild = List.generate(5, (_) => []);
  List<bool> autoCheckedList = List.generate(5, (_) => false);
  // 콜백 함수를 통해 자식 위젯의 데이터 업데이트
  void updateChildData(int index, List<int> newData, bool newAutoChecked) {
    setState(() {
      dataListFromChild[index] = newData;
      autoCheckedList[index] = newAutoChecked;
      debugPrint('$dataListFromChild');
      debugPrint('$autoCheckedList');
    });
    widget.callback(widget.index, dataListFromChild, autoCheckedList);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Row(
              children: List.generate(5,
                  (index) => OnePaper(index: index, callback: updateChildData)),
            ),
          ],
        ),
      ),
    );
  }
}

class OnePaper extends StatefulWidget {
  final int index;
  final Function(int, List<int>, bool) callback;

  const OnePaper({
    required this.index,
    required this.callback,
    super.key,
  });

  @override
  State<OnePaper> createState() => _OnePaperState();
}

class _OnePaperState extends State<OnePaper> {
  final List<String> alphabet = ['A', 'B', 'C', 'D', 'E'];

  bool autoChecked = false;

  Color autoColor = Colors.white;
  List<int> numberList = [];

  // 자식 위젯에서 호출할 콜백 함수
  void updateData(List<int> newData) {
    setState(() {
      // 콜백 함수를 통해 데이터 업데이트
      numberList = newData;
      if (numberList.length >= 6) {
        autoChecked = false;
        autoColor = Colors.white;
      }
      widget.callback(widget.index, numberList, autoChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        Column(
          children: [
            Container(
              width: 260,
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.pinkAccent,
                          width: 2,
                        ),
                      ),
                      color: Colors.pinkAccent,
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.pinkAccent,
                                  width: 2,
                                ),
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: Text(
                              alphabet[widget.index],
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              '1,000원',
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  LottoCheck(callback: updateData),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        '자동 및 반자동 선택',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (numberList.length >= 6) {
                                autoChecked = false;
                              } else if (numberList.length < 6) {
                                autoChecked = !autoChecked;
                              }

                              widget.callback(
                                  widget.index, numberList, autoChecked);
                              if (autoChecked) {
                                autoColor = Colors.black;
                              } else {
                                autoColor = Colors.white;
                              }
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                width: 30,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        width: 2, color: Colors.pinkAccent),
                                    left: BorderSide(
                                        width: 2, color: Colors.pinkAccent),
                                    right: BorderSide(
                                        width: 2, color: Colors.pinkAccent),
                                  ),
                                ),
                              ),
                              Icon(Icons.check, color: autoColor),
                              Container(
                                height: 5,
                                width: 30,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2, color: Colors.pinkAccent),
                                    left: BorderSide(
                                        width: 2, color: Colors.pinkAccent),
                                    right: BorderSide(
                                        width: 2, color: Colors.pinkAccent),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 260,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNumberBar(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildNumberBar() {
  return SizedBox(
    width: 260,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        12,
        (index) => Container(
          width: 8,
          height: 25,
          color: Colors.black,
        ),
      ),
    ),
  );
}
