import 'package:flutter/material.dart';
import 'package:growbase_mobile_flutter/features/authentication/view/login/login.page.dart';
import 'package:growbase_mobile_flutter/injection_container.dart' as di;
import 'package:growbase_mobile_flutter/themes/light.theme.dart';
import 'package:growbase_mobile_flutter/utils/routes.dart';

import 'features/authentication/view/create-account/create-account.page.dart';
import 'features/categories/view/categories/categories.page.dart';
import 'features/categories/view/category/category.page.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example',
      theme: lightTheme(context),
      routes: {
        Routes.splashScreen: (_) => const HomeWidget(),
        Routes.login: (_) => const LoginPage(),
        Routes.createAccount: (_) => const CreateAccountPage(),
        Routes.categories: (_) => const CategoriesPage(),
        Routes.category: (ctx) {
          final uid = ModalRoute.of(ctx)?.settings.arguments as String?;
          return CategoryPage(uid: uid);
        },
      },
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: OutlinedButton(
                child: const Text('Criar conta'),
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.createAccount),
              ),
            ),
            SizedBox(
              width: 300,
              child: OutlinedButton(
                child: const Text('Login'),
                onPressed: () => Navigator.of(context).pushNamed(Routes.login),
              ),
            ),
            SizedBox(
              width: 300,
              child: OutlinedButton(
                child: const Text('Categorias'),
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.categories),
              ),
            ),
            SizedBox(
              width: 300,
              child: OutlinedButton(
                child: const Text('Nova Categoria'),
                onPressed: () => Navigator.of(context).pushNamed(
                  Routes.category,
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: OutlinedButton(
                child: const Text('Editar Categoria'),
                onPressed: () => Navigator.of(context)
                    .pushNamed(Routes.category, arguments: 'any_uid'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
