import 'package:flutter/material.dart';

import '../../../../shared/view/widgets/primary_button.widget.dart';
import '../../../../utils/constants/routes.constants.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 200,
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: 'Login',
              onPressed: () =>
                  Navigator.of(context).pushNamed(RoutesConstants.login),
            ),
            const SizedBox(height: 8),
            PrimaryButton(
              text: 'Cadastro',
              onPressed: () => Navigator.of(context)
                  .pushNamed(RoutesConstants.createAccountEmail),
            ),
          ],
        ),
      ),
    );
  }
}
