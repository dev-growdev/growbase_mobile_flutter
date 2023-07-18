import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/view/stores/app.store.dart';
import '../../../../shared/view/widgets/bottom_sheet_layout.widget.dart';
import '../../../../shared/view/widgets/custom_snackbars.widget.dart';
import '../../../../utils/extension_methods/extensions_methods.dart';
import 'update_profile.store.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final AppStore appStore = GetIt.I();

  late final UpdateProfileStore store = UpdateProfileStore(
    service: GetIt.I(),
    appStore: appStore,
    user: appStore.user!,
  );

  void updateUser(BuildContext context) async {
    final form = Form.of(context);
    if (!form.validate()) return;

    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final result = await store.updateUser();

    if (result) {
      navigator.pop();
      messenger.showSnackBar(
        SuccessSnackBar(text: 'Perfil atualizado com sucesso!'),
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
              onPressed: () => updateUser(context),
            );
          }),
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Informações Pessoais',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              TextFormField(
                initialValue: appStore.user?.name,
                decoration: InputDecoration(
                  label: const Text('Nome Completo'),
                  errorText: store.failure != null ? '' : null,
                ),
                keyboardType: TextInputType.name,
                onChanged: store.setName,
                validator: (text) {
                  if (text == null || text.length < 3) {
                    return 'Preencha o seu nome corretamente.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: appStore.user?.document?.formatDocument(),
                decoration: InputDecoration(
                  label: const Text('CPF/CNPJ'),
                  errorText: store.failure != null ? '' : null,
                ),
                keyboardType: TextInputType.number,
                onChanged: (text) => store.setDocument(
                  text.removeSpecialCharacters(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfOuCnpjFormatter()
                ],
                validator: (text) {
                  final value = text!.removeSpecialCharacters();

                  if (!value.isValidDocument) {
                    return 'Preencha o seu CPF ou CNPJ corretamente.';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: appStore.user?.email,
                decoration: InputDecoration(
                  label: const Text('E-mail'),
                  errorText: store.failure != null ? '' : null,
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: store.setEmail,
                validator: (text) {
                  if (text == null || !text.isEmail) {
                    return 'Preencha o seu e-mail corretamente.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: appStore.user?.phone?.formatPhone(),
                decoration: InputDecoration(
                  label: const Text('Telefone'),
                  errorText: store.failure?.message,
                ),
                keyboardType: TextInputType.phone,
                onChanged: (text) => store.setPhone(
                  text.removeSpecialCharacters(),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter()
                ],
                validator: (text) {
                  final value = text!.removeSpecialCharacters();

                  if (value.isEmpty) return null;

                  if (!value.isValidPhone) {
                    return 'Preencha o seu telefone corretamente.';
                  }

                  return null;
                },
              ),
            ],
          ),
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
