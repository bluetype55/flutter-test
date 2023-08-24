import 'package:flutter/material.dart';
import 'package:lotto_app/result.dart';
import 'package:lotto_app/widget/lotto_ticket.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Center(
            child: Column(
              children: List.generate(2, (index) => const LottoTicket()),
            ),
          ),
        ),
      ),
    );
  }
}
