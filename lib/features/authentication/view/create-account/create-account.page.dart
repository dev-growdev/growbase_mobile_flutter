import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:growbase_mobile_flutter/utils/routes.dart';

import 'create-account.store.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final store = CreateAccountStore(GetIt.I());

  void doCreateAccount() async {
    final result = await store.createAccount();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          result
              ? 'Conta Criada'
              : store.failure?.message ?? 'Erro ao criar conta',
        ),
        backgroundColor: result ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(
                  'Nome',
                ),
              ),
              onChanged: (text) => store.setState(name: text),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(
                  'Email',
                ),
              ),
              onChanged: (text) => store.setState(email: text),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(
                  'CPF',
                ),
              ),
              onChanged: (text) => store.setState(document: text),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(
                  'Senha',
                ),
              ),
              onChanged: (text) => store.setState(password: text),
            ),
            const SizedBox(height: 16),
            Observer(builder: (context) {
              return SizedBox(
                height: 50,
                width: 180,
                child: ElevatedButton(
                  onPressed: store.isLoading ? null : doCreateAccount,
                  child: store.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Criar conta'),
                ),
              );
            }),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.login);
              },
              child: const Text(
                'Ja tenho conta. Entrar',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
