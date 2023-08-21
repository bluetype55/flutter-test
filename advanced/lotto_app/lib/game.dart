import 'package:flutter/material.dart';
import 'package:lotto_app/widget/lotto_paper.dart';

class Game extends StatelessWidget {
  final int gameCnt;
  const Game({required this.gameCnt, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('select numbers'),
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
                children: List.generate(gameCnt, (index) => const LottoPaper()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
