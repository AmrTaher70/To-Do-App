import 'package:flutter/material.dart';

import '../../app.colors.dart';

class CostumeTextButton extends StatelessWidget {
  const CostumeTextButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.white.withOpacity(.44), fontSize: 16)),
    );
  }
}
