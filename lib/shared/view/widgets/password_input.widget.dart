import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String label;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? errorText;
  final bool autofocus;

  const PasswordInput({
    Key? key,
    this.label = 'Senha',
    this.onSaved,
    this.onChanged,
    this.validator,
    this.errorText,
    this.autofocus = false,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
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
      onSaved: widget.onSaved,
      validator: (text) {
        if (text!.length < 6) {
          return 'Sua senha deve conter pelo menos 6 caractéres';
        }

        if (widget.validator != null) {
          return widget.validator!(text);

          // if (error != null) return error;
        }

        return null;
      },
    );
  }
}
