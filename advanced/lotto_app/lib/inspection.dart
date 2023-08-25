import 'package:flutter/material.dart';
import 'package:lotto_app/widget/lotto_ticket.dart';

class Inspection extends StatelessWidget {
  final List<int> lottoNum;
  final List<List<List<int>>> myNum;
  final List<List<String>> autoStringList;
  const Inspection({
    required this.lottoNum,
    required this.myNum,
    required this.autoStringList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Ticket inspection'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Center(
            child: Column(
              children: List.generate(
                  myNum.length,
                  (index) => LottoTicket(
                        lottoNum: lottoNum,
                        myNum: myNum[index],
                        autoStringList: autoStringList[index],
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
