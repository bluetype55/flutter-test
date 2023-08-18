import 'package:flutter/material.dart';

void main() {
  showData();
}

void showData() async {
  startTask();
  String? account = await accessData();
  fetchData(account);
}

void startTask() {
  String info1 = '요청수행 시작';
  debugPrint(info1);
}

Future<String?> accessData() async {
  String? account;

  Duration time = const Duration(seconds: 3);

  if (time.inSeconds > 2) {
    // sleep(time);
    await Future.delayed(time, () {
      account = '8,500만원';
      debugPrint(account);
    });
  } else {
    String info2 = '데이터에 접속중';
    debugPrint(info2);
  }
  return account;
}

void fetchData(String? account) {
  String info3 = '잔액은 $account입니다.';
  debugPrint(info3);
}
