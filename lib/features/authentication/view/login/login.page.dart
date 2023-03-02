import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/view/widgets/password_input.widget.dart';
import '../../../../shared/view/widgets/primary_button.widget.dart';
import '../../../../shared/view/widgets/rich_text_button.widget.dart';
import '../../../../shared/view/widgets/terms_and_policy.widget.dart';
import '../../../../utils/routes.dart';
import 'login.store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = LoginStore(GetIt.I());

  void doLogin() async {
    final navigator = Navigator.of(context);

    final result = await store.signIn();

    if (result) {
      navigator.pushReplacementNamed(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Observer(builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    errorText: store.failure != null ? '' : null,
                  ),
                  onChanged: (text) => store.setLogin(text),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                PasswordInput(
                  onChanged: (text) => store.setPass(text),
                  errorText: store.failure?.message,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                Observer(builder: (_) {
                  return PrimaryButton(
                    text: 'Entrar',
                    onPressed: doLogin,
                    isLoading: store.isLoading,
                  );
                }),
                const SizedBox(height: 32),
                RichTextButton(
                  onPressed: () => print('Recover password'),
                  firstText: 'Esqueceu a senha? ',
                  secondText: 'Clique aqui.',
                ),
                const SizedBox(height: 8),
                RichTextButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(Routes.createAccountEmail),
                  firstText: 'Novo por aqui? ',
                  secondText: 'Inscreva-se agora.',
                ),
                const SizedBox(height: 96),
                const TermsAndPolicy()
              ],
            );
          }),
        ),
      ),
    );
  }
}
