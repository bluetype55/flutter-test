import 'package:basic_second/responsive/desktop_body.dart';
import 'package:basic_second/responsive/mobile_body.dart';
import 'package:basic_second/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: MobileBody(), desktopBody: DesktopBody()),
    );
  }
}
