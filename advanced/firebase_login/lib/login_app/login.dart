import 'package:flutter/material.dart';
import 'package:login_app/my_button/my_button.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: _buildButton(),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(
            color: Colors.white,
            image: Image.asset('image/glogo.png'),
            onPressed: () {},
            radius: 4,
            text: const Text(
              'Login with Google',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 10),
          MyButton(
            color: const Color(0xFF334D92),
            image: Image.asset('image/flogo.png'),
            onPressed: () {},
            radius: 4,
            text: const Text(
              'Login with Facebook',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 10),
          MyButton(
            color: Colors.green,
            image: const Icon(
              Icons.mail,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
            radius: 4,
            text: const Text(
              'Login with Email',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
