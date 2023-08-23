import 'package:flutter/material.dart';

class LottoCheck extends StatefulWidget {
  final Function(List<int>) callback; // 부모 위젯으로 전달할 콜백 함수

  const LottoCheck({required this.callback, super.key});

  @override
  State<LottoCheck> createState() => _LottoCheckState();
}

class _LottoCheckState extends State<LottoCheck> {
  List<bool> checkedList = List.generate(45, (index) => false);
  List<Color> colorList = List.generate(45, (index) => Colors.white);
  List<int> numberList = [];

  void sendDataToParent(List<int> numberList) {
    List<int> data = numberList;
    widget.callback(data); // 부모 위젯의 콜백 함수 호출하여 데이터 전달
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      padding: const EdgeInsets.all(4),
      child: GridView.count(
        crossAxisCount: 6,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          45,
          (index) {
            return InkWell(
              onTap: () {
                setState(() {
                  if (numberList.length < 6) {
                    checkedList[index] = !checkedList[index];
                  } else if (numberList.length >= 6) {
                    checkedList[index] = false;
                  }
                  if (checkedList[index]) {
                    colorList[index] = Colors.black;
                    numberList.add(index + 1);
                  } else {
                    colorList[index] = Colors.white;
                    numberList.remove(index + 1);
                  }
                  numberList = numberList.toSet().toList();
                  numberList.sort();
                  sendDataToParent(numberList);
                });
              },
              child: Column(
                children: [
                  Container(
                    height: 5,
                    width: 30,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 2, color: Colors.pinkAccent),
                        left: BorderSide(width: 2, color: Colors.pinkAccent),
                        right: BorderSide(width: 2, color: Colors.pinkAccent),
                      ),
                    ),
                  ),
                  Container(
                    height: 28,
                    decoration: BoxDecoration(
                      color: colorList[index],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 30,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 2, color: Colors.pinkAccent),
                        left: BorderSide(width: 2, color: Colors.pinkAccent),
                        right: BorderSide(width: 2, color: Colors.pinkAccent),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
