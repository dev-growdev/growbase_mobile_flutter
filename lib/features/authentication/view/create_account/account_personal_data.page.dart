import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../shared/view/widgets/primary_button.widget.dart';
import '../../../../shared/view/widgets/rich_text_button.widget.dart';
import '../../../../utils/extensions_methods.dart';
import '../../../../utils/routes.dart';
import 'create_account.store.dart';

class AccountPersonalDataPage extends StatefulWidget {
  final CreateAccountStore store;

  const AccountPersonalDataPage({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<AccountPersonalDataPage> createState() =>
      _AccountPersonalDataPageState();
}

class _AccountPersonalDataPageState extends State<AccountPersonalDataPage> {
  CreateAccountStore get store => widget.store;

  void next(BuildContext context) {
    final form = Form.of(context);
    if (!form.validate()) return;

    Navigator.of(context).pushNamed(
      Routes.createAccountPassword,
      arguments: store,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Preencha seus dados.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  autofocus: true,
                  initialValue: store.state.name,
                  decoration: const InputDecoration(
                    label: Text('Nome Completo'),
                  ),
                  onChanged: store.setName,
                  keyboardType: TextInputType.name,
                  validator: (text) {
                    if (text == null || text.length < 3) {
                      return 'Preencha o seu nome corretamente.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: store.state.document.formatDocument(),
                  decoration: const InputDecoration(
                    label: Text('CPF/CNPJ'),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfOuCnpjFormatter()
                  ],
                  onChanged: (text) => store.setDocument(
                    text.removeSpecialCharacters(),
                  ),
                  validator: (text) {
                    final value = text!.removeSpecialCharacters();

                    if (!value.isValidDocument()) {
                      return 'Preencha o seu CPF ou CNPJ corretamente.';
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
                      Navigator.of(context).pushNamed(Routes.login),
                  firstText: 'Já criou sua conta? ',
                  secondText: 'Acesse aqui.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
