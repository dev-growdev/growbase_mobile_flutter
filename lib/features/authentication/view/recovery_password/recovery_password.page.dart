import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/view/widgets/body_layout.widget.dart';
import '../../../../shared/view/widgets/primary_button.widget.dart';
import '../../../../shared/view/widgets/rich_text_button.widget.dart';
import '../../../../utils/extensions_methods.dart';
import 'recovery_password.store.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({super.key});

  @override
  State<RecoveryPasswordPage> createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState extends State<RecoveryPasswordPage> {
  final store = RecoveryPasswordStore(GetIt.I());

  String email = '';

  void next(BuildContext context) async {
    final form = Form.of(context);
    if (!form.validate()) return;

    await store.sendRecovery(email);

    if (!mounted) return;
    final bottomSheet =
        showBottomSheet(context: context, builder: (_) => const _SuccessPage());
    bottomSheet.closed.then((_) => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: BodyLayout(
        hasAppBar: true,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recuperação de senha',
                style: theme.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Coloque o seu e-mail para recuperação da senha.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                onChanged: (text) => email = text,
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text == null || !text.isEmail) {
                    return 'E-mail inválido';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 32),
              Observer(builder: (context) {
                return PrimaryButton(
                  text: 'Continuar',
                  onPressed: () => next(context),
                  isLoading: store.isLoading,
                );
              }),
              const SizedBox(height: 32),
              RichTextButton(
                onPressed: () => print('Help'),
                firstText: 'Não consegue recuperar a senha? ',
                secondText: 'Fale conosco.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SuccessPage extends StatelessWidget {
  const _SuccessPage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Um e-mail foi enviado!',
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          const Text(
            'Verifique sua caixa de entrada e siga as instruções para redefinir sua senha.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            text: 'Ok',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
