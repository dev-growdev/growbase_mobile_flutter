import 'package:flutter/material.dart';
import 'package:growbase_mobile_flutter/features/authentication/view/start/start.page.dart';

import 'features/authentication/view/create_account/account_email.page.dart';
import 'features/authentication/view/create_account/account_password.page.dart';
import 'features/authentication/view/create_account/account_personal_data.page.dart';
import 'features/authentication/view/create_account/create_account.store.dart';
import 'features/authentication/view/login/login.page.dart';
import 'features/categories/view/categories/categories.page.dart';
import 'features/categories/view/category/category.page.dart';
import 'features/splash/view/splash.page.dart';
import 'injection_container.dart' as di;
import 'shared/view/home/home.page.dart';
import 'themes/theme.dart';
import 'utils/routes.dart';

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
      theme: lightTheme(),
      darkTheme: darkTheme(),
      // themeMode: ThemeMode.dark,
      routes: {
        Routes.splashScreen: (_) => const SplashPage(),
        Routes.startPage: (_) => const StartPage(),
        Routes.login: (_) => const LoginPage(),
        Routes.createAccountEmail: (_) => const AccountEmailPage(),
        Routes.createAccountPersonalData: (ctx) {
          final store =
              ModalRoute.of(ctx)?.settings.arguments as CreateAccountStore;
          return AccountPersonalDataPage(store: store);
        },
        Routes.createAccountPassword: (ctx) {
          final store =
              ModalRoute.of(ctx)?.settings.arguments as CreateAccountStore;
          return AccountPasswordPage(store: store);
        },
        Routes.home: (_) => const HomePage(),
        Routes.categories: (_) => const CategoriesPage(),
        Routes.category: (ctx) {
          final uid = ModalRoute.of(ctx)?.settings.arguments as String?;
          return CategoryPage(uid: uid);
        },
      },
    );
  }
}
