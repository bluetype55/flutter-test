import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Study to Container'),
          centerTitle: true,
        ),
        body: CustomContainer(),
      ),
    ),
  );
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
      decoration: BoxDecoration(
        color: Color(0xFF85D078),
        border: Border.all(
          color: Colors.red,
          width: 5,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(6, 6),
            blurRadius:10,
            spreadRadius:10,
          ),
          BoxShadow(
            color: Colors.amber.shade300,
            offset: Offset(-6, -6),
            blurRadius:10,
            spreadRadius:10,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: 100,
      ),
      child: Center(
        child: Container(
          color: Colors.amber,
          child: Text(
              '000000000000000000000000000000000000000000000000000000000000000000'),
        ),
      ),
    );
  }
}
