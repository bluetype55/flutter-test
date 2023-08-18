import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget image;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.color,
    required this.image,
    required this.onPressed,
    required this.radius,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        fixedSize: const Size.fromHeight(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          image,
          text,
          Opacity(
            opacity: 0,
            child: image,
          ),
        ],
      ),
    );
  }
}
