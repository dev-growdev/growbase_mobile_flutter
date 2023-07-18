import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../shared/errors/failures.dart';
import '../../../../shared/view/widgets/body_layout.widget.dart';
import '../../../../shared/view/widgets/password_input.widget.dart';
import '../../../../shared/view/widgets/primary_button.widget.dart';
import '../../../../shared/view/widgets/rich_text_button.widget.dart';
import '../../../../shared/view/widgets/terms_and_policy.widget.dart';
import '../../../../utils/constants/routes.constants.dart';
import 'login.store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = LoginStore(
    loginService: GetIt.I(),
    saveUserLoggedService: GetIt.I(),
  );
  late final ReactionDisposer reactionDisposer;

  void doLogin() async {
    final navigator = Navigator.of(context);

    final result = await store.signIn();

    if (result) {
      navigator.pushNamedAndRemoveUntil(
        RoutesConstants.home,
        (_) => false,
      );
    }
  }

  void initializeReactions() {
    reactionDisposer = reaction((_) => store.failure, (failure) {
      if (failure is UserNotVerifiedFailure) {
        Navigator.of(context).pushNamed(
          RoutesConstants.verifyAccount,
          arguments: {
            'login': store.login,
            'onSuccess': doLogin,
            'sendCode': true,
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initializeReactions();
  }

  @override
  void dispose() {
    reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BodyLayout(
        hasAppBar: true,
        topFlex: 6,
        bottomWidget: const Flexible(
          child: TermsAndPolicy(),
        ),
        child: Observer(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: const Text('Email'),
                  errorText: store.failure != null ? '' : null,
                ),
                onChanged: store.setLogin,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              PasswordInput(
                onChanged: store.setPass,
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
                onPressed: () => Navigator.of(context)
                    .pushNamed(RoutesConstants.recoveryPassword),
                firstText: 'Esqueceu a senha? ',
                secondText: 'Clique aqui.',
              ),
              const SizedBox(height: 8),
              RichTextButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(RoutesConstants.createAccountEmail),
                firstText: 'Novo por aqui? ',
                secondText: 'Inscreva-se agora.',
              ),
            ],
          );
        }),
      ),
    );
  }
}
