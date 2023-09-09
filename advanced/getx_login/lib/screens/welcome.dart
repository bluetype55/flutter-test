import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getx_login/controller/auth_controller.dart';

class WelcomePage extends StatelessWidget {
  final User user;
  const WelcomePage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Welcome! ${user.email}'),
            IconButton(
                onPressed: () {
                  AuthController.instance.logout();
                },
                icon: Icon(Icons.login_outlined)),
          ],
        ),
      ),
    );
  }
}
