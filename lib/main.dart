import 'package:flutter/material.dart';

import 'features/authentication/view/create_account/account_email.page.dart';
import 'features/authentication/view/create_account/account_password.page.dart';
import 'features/authentication/view/create_account/account_personal_data.page.dart';
import 'features/authentication/view/create_account/create_account.store.dart';
import 'features/authentication/view/login/login.page.dart';
import 'features/authentication/view/recovery_password/recovery_password.page.dart';
import 'features/authentication/view/start/start.page.dart';
import 'features/authentication/view/verify_account/verify_account.page.dart';
import 'features/categories/view/categories/categories.page.dart';
import 'features/categories/view/category/category.page.dart';
import 'features/help_desk/view/faqs/faqs.page.dart';
import 'features/help_desk/view/request_help/request_help.dart';
import 'features/splash/view/splash.page.dart';
import 'injection_container.dart' as di;
import 'shared/view/home/home.page.dart';
import 'themes/theme.dart';
import 'utils/constants/routes.constants.dart';

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
        RoutesConstants.splashScreen: (_) => const SplashPage(),
        RoutesConstants.startPage: (_) => const StartPage(),
        RoutesConstants.login: (_) => const LoginPage(),
        RoutesConstants.verifyAccount: (ctx) {
          final args =
              ModalRoute.of(ctx)?.settings.arguments as Map<String, dynamic>;
          return VerifyAccountPage(
            login: args['login'] as String,
            onSuccess: args['onSuccess'] as void Function(),
            sendCode: args['sendCode'] ?? false,
          );
        },
        RoutesConstants.createAccountEmail: (_) => const AccountEmailPage(),
        RoutesConstants.createAccountPersonalData: (ctx) {
          final store =
              ModalRoute.of(ctx)?.settings.arguments as CreateAccountStore;
          return AccountPersonalDataPage(store: store);
        },
        RoutesConstants.createAccountPassword: (ctx) {
          final store =
              ModalRoute.of(ctx)?.settings.arguments as CreateAccountStore;
          return AccountPasswordPage(store: store);
        },
        RoutesConstants.home: (_) => const HomePage(),
        RoutesConstants.recoveryPassword: (_) => const RecoveryPasswordPage(),
        RoutesConstants.faqs: (_) => const FaqsPage(),
        RoutesConstants.requestHelp: (_) => const RequestHelpPage(),
        RoutesConstants.categories: (_) => const CategoriesPage(),
        RoutesConstants.category: (ctx) {
          final uid = ModalRoute.of(ctx)?.settings.arguments as String?;
          return CategoryPage(uid: uid);
        },
      },
    );
  }
}
