import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/view/widgets/password-input.widget.dart';
import '../../../../shared/view/widgets/primary-button.widget.dart';
import '../../../../shared/view/widgets/terms-and-policy.widget.dart';
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
                InkWell(
                  onTap: () => print('Recover password'),
                  borderRadius: BorderRadius.circular(6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Esqueceu a senha? ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'Clique aqui.',
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    print('Register');
                  },
                  borderRadius: BorderRadius.circular(6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Novo por aqui? ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'Inscreva-se agora.',
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
