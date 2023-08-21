import 'package:flutter/material.dart';
import 'package:lotto_app/widget/lotto_check.dart';

class LottoPaper extends StatelessWidget {
  const LottoPaper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Row(
              children: List.generate(5, (index) => OnePaper(index: index)),
            ),
            Padding(
              padding: const EdgeInsets.all(75.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  shape: const CircleBorder(eccentricity: 0.0),
                  fixedSize: const Size(100, 100),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.arrow_forward,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnePaper extends StatelessWidget {
  final int index;
  final List<String> alphabet = ['A', 'B', 'C', 'D', 'E'];
  OnePaper({
    required this.index,
    super.key,
  });

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
                              alphabet[index],
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
                  const LottoCheck(),
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
                            const Icon(Icons.check, color: Colors.white),
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