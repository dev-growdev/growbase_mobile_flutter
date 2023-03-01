import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? errorText;

  const PasswordInput({
    Key? key,
    this.label = 'Senha',
    this.controller,
    this.onChanged,
    this.validator,
    this.errorText,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        label: Text(
          widget.label,
        ),
        errorText: widget.errorText,
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => setState(() => obscureText = !obscureText),
        ),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
