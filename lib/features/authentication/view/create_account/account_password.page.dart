import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/view/widgets/body_layout.widget.dart';
import '../../../../shared/view/widgets/password_input.widget.dart';
import '../../../../shared/view/widgets/primary_button.widget.dart';
import '../../../../shared/view/widgets/rich_text_button.widget.dart';
import '../../../../shared/view/widgets/terms_and_policy.widget.dart';
import '../../../../utils/routes.dart';
import 'create_account.store.dart';

class AccountPasswordPage extends StatefulWidget {
  final CreateAccountStore store;
  const AccountPasswordPage({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<AccountPasswordPage> createState() => _AccountPasswordPageState();
}

class _AccountPasswordPageState extends State<AccountPasswordPage> {
  String pass = '';
  String confirmPass = '';
  CreateAccountStore get store => widget.store;

  void _createAccount(BuildContext context) async {
    final form = Form.of(context);
    final navigator = Navigator.of(context);
    if (!form.validate()) return;

    form.save();

    final canNavigate = await store.createAccount();

    if (canNavigate) {
      navigator.pushNamedAndRemoveUntil(
        Routes.login,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: BodyLayout(
        bottomWidget: Column(
          children: const [
            TermsAndPolicy(actionText: 'Cadastre-se'),
            SizedBox(height: 32),
          ],
        ),
        child: Observer(builder: (context) {
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Crie uma senha.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                PasswordInput(
                  autofocus: true,
                  onChanged: (text) => pass = text,
                  errorText: store.failure != null ? '' : null,
                ),
                const SizedBox(height: 16),
                PasswordInput(
                  onChanged: (text) {
                    confirmPass = text;
                    store.clearFailure();
                  },
                  onSaved: (text) => store.setPassword(text!),
                  errorText: store.failure?.message,
                  label: 'Confirme sua senha',
                  validator: (text) {
                    if (text != pass) {
                      return 'Suas senhas não coincidem';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                Observer(builder: (context) {
                  return PrimaryButton(
                    text: 'Cadastre-se',
                    onPressed: () => _createAccount(context),
                    isLoading: store.isLoading,
                  );
                }),
                const SizedBox(height: 32),
                RichTextButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.login),
                  firstText: 'Já criou sua conta? ',
                  secondText: 'Acesse aqui.',
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
