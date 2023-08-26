import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotto_app/result.dart';

class LottoTicket extends StatelessWidget {
  final List<int> lottoNum;
  final List<List<int>> myNum;
  final List<String> autoStringList;
  const LottoTicket({
    required this.lottoNum,
    required this.myNum,
    required this.autoStringList,
    super.key,
  });

  List<String> autoCheckToString(
      List<List<int>> myNum, List<bool> autoCheckedList) {
    List<String> autoString = ['', '', '', '', ''];
    for (var i = 0; i < myNum.length; i++) {
      if (myNum[i].isEmpty && autoCheckedList[i]) {
        autoString[i] = '자      동';
      } else if (myNum[i].isNotEmpty && !autoCheckedList[i]) {
        autoString[i] = '수      동';
      } else {
        autoString[i] = '반 자 동';
      }
    }
    return autoString;
  }

  @override
  Widget build(BuildContext context) {
    List<String> uniqueNumber = [];
    for (var i = 0; i < 7; i++) {
      uniqueNumber.add(randomNumber(10, 5));
    }
    return Column(
      children: [
        Container(
          width: 320,
          height: 490,
          decoration: BoxDecoration(
            color: Colors.white,
            image: const DecorationImage(
              image: AssetImage('image/water_mark.png'),
              fit: BoxFit.contain,
              opacity: 0.3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // 그림자 색상
                spreadRadius: 4, // 그림자 확산 정도
                blurRadius: 7, // 그림자 흐림 정도
                offset: const Offset(2, 3), // 그림자 위치 (x, y)
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  '「절반의 행운, 절반의 기부」',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset(
                                  'image/lotto_mono2.png',
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'image/qr_code.png',
                            width: 90,
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 5, right: 10),
                        child: Column(
                          children: [
                            UniqueInfo(uniqueNumber: uniqueNumber),
                            const Row(
                              children: [
                                Text(
                                    '--------------------------------------------------------------------')
                              ],
                            ),
                            Column(
                              children: List.generate(
                                myNum.length,
                                (index) => TicketNumber(
                                  autoString: autoStringList,
                                  index: index,
                                  myNumber: myNum,
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                    '--------------------------------------------------------------------')
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '금액',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '￦5,000',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                uniqueNumber.length,
                                (index) => Transform.scale(
                                  scaleY: 2,
                                  origin:
                                      const Offset(0, 0), // 변환 기준점 (여기서는 좌상단)
                                  child: Text(
                                    uniqueNumber[index],
                                    style: const TextStyle(
                                      fontSize: 12, // 원하는 폰트 크기
                                      height: 2, // 높이를 키울 비율 (글자 높이 * height)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Image.asset('image/barcode.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 490,
                width: 20,
                color: Colors.pink[100],
                child: const RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    '● 전화문의 및 당첨번호 안내(ARS): 전국1588-6450   ● 전화문의 및 당첨번호 안내(ARS): 전국1588-6450',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Result(lottoNum: lottoNum, myNum: myNum)),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '당첨 결과 확인 ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}

String randomNumber(int range, int digit) {
  Random random = Random();
  String uniqueNumber = '';
  for (var i = 0; i < digit; i++) {
    uniqueNumber += random.nextInt(10).toString();
  }
  return uniqueNumber;
}

class UniqueInfo extends StatelessWidget {
  final List<String> uniqueNumber;
  const UniqueInfo({super.key, required this.uniqueNumber});

  String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  String getWeekDay(int dayNum) {
    switch (dayNum) {
      case 1:
        return '월';
      case 2:
        return '화';
      case 3:
        return '수';
      case 4:
        return '목';
      case 5:
        return '금';
      case 6:
        return '토';
      case 7:
        return '일';
      default:
        return '?';
    }
  }

  String generateSecurityCode() {
    final random = Random();
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    String code = '';
    for (int i = 0; i < 16; i++) {
      final randomIndex = random.nextInt(chars.length);
      code += chars[randomIndex];
    }

    return code;
  }

  String generateDealerCode() {
    Random random = Random();
    String code = '';
    code += (random.nextInt(2) + 1).toString();
    code += (random.nextInt(89) + 11).toString();
    code += (random.nextInt(999999) + 1).toString().padLeft(6, '0');
    return code;
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now().toLocal();
    DateTime paymentDeadline = now.add(const Duration(days: 365));
    String ticketingRecord =
        now.microsecondsSinceEpoch.toString().substring(0, 10);
    String securityCode = generateSecurityCode();
    String dealerCode = generateDealerCode();
    Random random = Random();
    int salesNumber = random.nextInt(10000);
    String salesCode = salesNumber.toString().padLeft(10, '0');

    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '제  9999  회',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text('발  행  일  :  ',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            Text(
                '${now.year}/${_formatNumber(now.month)}/${_formatNumber(now.day)}',
                style: const TextStyle(fontSize: 13)),
            Text('  (${getWeekDay(now.weekday)})  ',
                style: const TextStyle(fontSize: 13)),
            Text(
                '${_formatNumber(now.hour)}:${_formatNumber(now.minute)}:${_formatNumber(now.second)}',
                style: const TextStyle(fontSize: 13)),
          ],
        ),
        Row(
          children: [
            const Text('추  첨  일  :  ',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            Text(
                '${now.year}/${_formatNumber(now.month)}/${_formatNumber(now.day)}',
                style: const TextStyle(fontSize: 13)),
            Text('  (${getWeekDay(now.weekday)})  ',
                style: const TextStyle(fontSize: 13)),
            Text(
              'TR:$ticketingRecord',
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
        Row(
          children: [
            const Text('지급기한  :  ',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.1)),
            Text(
              '${paymentDeadline.year}/${_formatNumber(paymentDeadline.month)}/${_formatNumber(paymentDeadline.day)}',
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                uniqueNumber.length,
                (index) => Text(uniqueNumber[index],
                    style: const TextStyle(fontSize: 11.5)))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              securityCode,
              style: const TextStyle(fontSize: 11),
            ),
            Text(
              '$dealerCode/$salesCode',
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }
}

class TicketNumber extends StatelessWidget {
  final int index;
  final List<List<int>> myNumber;
  final List<String> autoString;
  const TicketNumber({
    required this.autoString,
    required this.index,
    required this.myNumber,
    super.key,
  });

  List<List<int>> autoSelect(List<List<int>> myNum) {
    for (var i = 0; i < myNum.length; i++) {
      if (myNum[i].isEmpty) {
        myNum[i] = (List.generate(45, (index) => ++index)..shuffle())
            .sublist(0, 6)
          ..sort();
      } else if (myNum[i].length < 6) {
        final Set<int> mySet = myNum[i].toSet();
        final random = Random();

        while (mySet.length != 6) {
          mySet.add(random.nextInt(45) + 1);
        }
        myNum[i] = mySet.toList()..sort();
      }
    }
    return myNum;
  }

  String intToString(int number) {
    if (number < 10) {
      return '0$number';
    } else {
      return '$number';
    }
  }

  @override
  Widget build(BuildContext context) {
    autoSelect(myNumber);
    List<String> alphbet = ['A', 'B', 'C', 'D', 'E'];
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            alphbet[index],
            style: const TextStyle(
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Text(
            autoString[index],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: List.generate(
            myNumber[index].length,
            (i) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  intToString(myNumber[index][i]),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
