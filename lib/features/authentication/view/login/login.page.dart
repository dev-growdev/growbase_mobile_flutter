import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:growbase_mobile_flutter/utils/routes.dart';

import 'login.store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = LoginStore(GetIt.I());

  void doLogin() async {
    final result = await store.signIn();

    result
        ? Navigator.of(context).pushReplacementNamed(Routes.categories)
        : ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                store.failure?.message ?? 'Erro no login',
              ),
              backgroundColor: Colors.red,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(
                  'Email',
                ),
              ),
              onChanged: (text) => store.setLogin(text),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(
                  'Senha',
                ),
              ),
              onChanged: (text) => store.setPass(text),
            ),
            const SizedBox(height: 16),
            Observer(builder: (context) {
              return SizedBox(
                height: 50,
                width: 180,
                child: ElevatedButton(
                  onPressed: store.isLoading ? null : doLogin,
                  child: store.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Entrar'),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
