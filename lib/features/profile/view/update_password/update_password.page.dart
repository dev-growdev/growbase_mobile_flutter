import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/view/widgets/bottom_sheet_layout.widget.dart';
import '../../../../shared/view/widgets/custom_snackbars.widget.dart';
import '../../../../shared/view/widgets/password_input.widget.dart';
import 'update_password.store.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  String newPass = '';
  String confirmNewPass = '';
  final UpdatePasswordStore store = UpdatePasswordStore(GetIt.I());

  void updatePassword(BuildContext context) async {
    final form = Form.of(context);
    if (!form.validate()) return;

    form.save();

    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final result = await store.updatePassword();

    if (result) {
      navigator.pop();
      messenger.showSnackBar(
        SuccessSnackBar(text: 'Senha atualizada com sucesso!'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      child: BottomSheetLayout(
        actions: [
          Observer(builder: (context) {
            return _SaveButton(
              isLoading: store.isLoading,
              onPressed: () => updatePassword(context),
            );
          }),
        ],
        child: SingleChildScrollView(
          child: Observer(builder: (_) {
            return Column(
              children: [
                Text(
                  'Trocar senha',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 32),
                PasswordInput(
                  label: 'Senha atual',
                  onChanged: store.setPassword,
                  errorText: store.failure != null ? '' : null,
                ),
                const SizedBox(height: 16),
                PasswordInput(
                  label: 'Nova senha',
                  onChanged: (text) => newPass = text,
                  errorText: store.failure != null ? '' : null,
                ),
                const SizedBox(height: 16),
                PasswordInput(
                  label: 'Confirmar nova senha',
                  onChanged: (text) => confirmNewPass = text,
                  onSaved: (text) => store.setNewPassword(text!),
                  errorText: store.failure?.message,
                  validator: (text) {
                    if (text != newPass) {
                      return 'Suas senhas não coincidem';
                    }
                    return null;
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  final bool isLoading;
  final void Function() onPressed;

  const _SaveButton({
    Key? key,
    required this.isLoading,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(),
          )
        : TextButton(
            onPressed: onPressed,
            child: Text(
              'Salvar',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          );
  }
}
