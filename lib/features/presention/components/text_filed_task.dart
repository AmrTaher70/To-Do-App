import 'package:flutter/material.dart';
import 'package:up_course2/core/app.colors.dart';

class TextFiledTask extends StatelessWidget {
  const TextFiledTask(
      {super.key,
      required this.title,
      required this.hintTitle,
      required this.controller,
      this.suffixIcon,
      this.readonly = false});
  final String title;
  final IconButton? suffixIcon;
  final String hintTitle;
  final TextEditingController? controller;
  final bool readonly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          readOnly: readonly,
          controller: controller,
          style: const TextStyle(color: AppColors.white),
          decoration: InputDecoration(
            hintText: hintTitle,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
