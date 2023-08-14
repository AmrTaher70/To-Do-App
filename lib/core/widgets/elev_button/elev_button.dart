import 'package:flutter/material.dart';

class ElevCustomButton extends StatelessWidget {
  const ElevCustomButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          // Adjust button style here
          ),
      child: Text(text),
    );
  }
}
