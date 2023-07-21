import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/view/widgets/body_layout.widget.dart';
import '../../../../shared/view/widgets/primary_button.widget.dart';
import '../../../../shared/view/widgets/rich_text_button.widget.dart';
import '../../../../utils/constants/routes.constants.dart';
import '../../../../utils/extension_methods/extensions_methods.dart';
import 'create_account.store.dart';

class AccountEmailPage extends StatefulWidget {
  const AccountEmailPage({super.key});

  @override
  State<AccountEmailPage> createState() => _AccountEmailPageState();
}

class _AccountEmailPageState extends State<AccountEmailPage> {
  final store = CreateAccountStore(GetIt.I());

  void next(BuildContext context) {
    final form = Form.of(context);
    if (!form.validate()) return;

    Navigator.of(context).pushNamed(
      RoutesConstants.createAccountPersonalData,
      arguments: store,
    );
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
                'Preencha seu e-mail.',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                onChanged: store.setEmail,
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text == null || !text.isEmail) {
                    return 'E-mail inválido';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 32),
              Builder(builder: (context) {
                return PrimaryButton(
                  text: 'Continuar',
                  onPressed: () => next(context),
                );
              }),
              const SizedBox(height: 32),
              RichTextButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(RoutesConstants.login),
                firstText: 'Já criou sua conta? ',
                secondText: 'Acesse aqui.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
