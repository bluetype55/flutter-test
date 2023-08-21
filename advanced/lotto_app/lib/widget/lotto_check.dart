import 'package:flutter/material.dart';

class LottoCheck extends StatefulWidget {
  const LottoCheck({super.key});

  @override
  State<LottoCheck> createState() => _LottoCheckState();
}

class _LottoCheckState extends State<LottoCheck> {
  final bool checked = false;
  Color color = Colors.white;
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
                print(index + 1);
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
                    decoration: const BoxDecoration(
                      color: Colors.white,
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
