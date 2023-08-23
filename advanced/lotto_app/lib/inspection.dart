import 'package:flutter/material.dart';

class Inspection extends StatelessWidget {
  const Inspection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Ticket inspection'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                  width: 320,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                              const SizedBox(height: 35),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                      'image/lotto_mono.png',
                                      width: 130,
                                    ),
                                  ),
                                  Image.asset(
                                    'image/qr_code.png',
                                    width: 80,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 5, right: 10),
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '제  1007  회',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('발  행  일  :  ',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold)),
                                        Text('2014/10/11',
                                            style: TextStyle(fontSize: 13)),
                                        Text('  (토)  ',
                                            style: TextStyle(fontSize: 13)),
                                        Text('11:20:08',
                                            style: TextStyle(fontSize: 13)),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('추  첨  일  :  ',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold)),
                                        Text('2014/10/11',
                                            style: TextStyle(fontSize: 13)),
                                        Text('  (토)  ',
                                            style: TextStyle(fontSize: 13)),
                                        Text(
                                          'TR:1589142506',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('지급기한  :  ',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.1)),
                                        Text(
                                          '2015/10/12  ',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '88888',
                                          style: TextStyle(fontSize: 11.5),
                                        ),
                                        Text(
                                          '88888',
                                          style: TextStyle(fontSize: 11.5),
                                        ),
                                        Text(
                                          '88888',
                                          style: TextStyle(fontSize: 11.5),
                                        ),
                                        Text(
                                          '88888',
                                          style: TextStyle(fontSize: 11.5),
                                        ),
                                        Text(
                                          '88888',
                                          style: TextStyle(fontSize: 11.5),
                                        ),
                                        Text(
                                          '88888',
                                          style: TextStyle(fontSize: 11.5),
                                        ),
                                        Text(
                                          '88888',
                                          style: TextStyle(fontSize: 11.5),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'N7FNA1SHJNR3BQV6',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                        Text(
                                          '148000080/0000001191',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                            '--------------------------------------------------------------------')
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'A',
                                          style: TextStyle(
                                              fontFamily: 'RobotoMono'),
                                        ),
                                        Text('수    동'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'B',
                                          style: TextStyle(
                                              fontFamily: 'RobotoMono'),
                                        ),
                                        Text(
                                          '반자동',
                                          style: TextStyle(letterSpacing: 0.2),
                                        ),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'C',
                                          style: TextStyle(
                                              fontFamily: 'RobotoMono'),
                                        ),
                                        Text('자    동'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'D',
                                          style: TextStyle(
                                              fontFamily: 'RobotoMono'),
                                        ),
                                        Text('자    동'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'E',
                                          style: TextStyle(
                                              fontFamily: 'RobotoMono'),
                                        ),
                                        Text('자    동'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                        Text('01'),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                            '--------------------------------------------------------------------')
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '금액',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          '￦5,000',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Transform.scale(
                                          scaleY: 2,
                                          origin: const Offset(
                                              0, 0), // 변환 기준점 (여기서는 좌상단)
                                          child: const Text(
                                            '88888 88888 55555 88888 88888 88888 88888',
                                            style: TextStyle(
                                              fontSize: 12, // 원하는 폰트 크기
                                              height:
                                                  2, // 높이를 키울 비율 (글자 높이 * height)
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image.asset('image/barcode.png'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 400,
                        width: 20,
                        color: Colors.pink[100],
                        child: const RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            '●전화문의 및 당첨번호 안내(ARS): 전국1588-6450   ●전화문의 및 당첨번호 안내(ARS): 전국1588-6450',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
