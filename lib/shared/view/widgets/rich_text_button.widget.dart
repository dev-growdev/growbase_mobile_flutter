import 'package:flutter/material.dart';

class RichTextButton extends StatelessWidget {
  final String firstText;
  final String secondText;
  final void Function() onPressed;

  const RichTextButton({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: RichText(
          text: TextSpan(
            text: firstText,
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: secondText,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
