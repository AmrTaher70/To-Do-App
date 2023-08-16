import 'package:flutter/material.dart';
import 'package:up_course2/core/app.colors.dart';

// ignore: must_be_immutable
class ElevCustomButton extends StatelessWidget {
  ElevCustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = AppColors.primary});
  final String text;
  final VoidCallback onPressed;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context)
          .elevatedButtonTheme
          .style!
          .copyWith(backgroundColor: MaterialStatePropertyAll(backgroundColor)),
      child: Text(text),
    );
  }
}
