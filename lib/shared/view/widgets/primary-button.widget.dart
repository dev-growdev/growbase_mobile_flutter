import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isLoading;
  final bool isDisabled;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: isDisabled
            ? null
            : isLoading
                ? () {}
                : onPressed,
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : const Text('Entrar'),
      ),
    );
  }
}
