import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';

import '../../services/get_terms_and_policy.service.dart';

class TermsAndPolicy extends StatelessWidget {
  final String actionText;
  const TermsAndPolicy({
    Key? key,
    this.actionText = 'Entrar',
  }) : super(key: key);

  void openTerms(BuildContext context) async {
    final service = GetIt.I<GetTermsAndPolicyService>();
    final term = await service('Term');

    // ignore: use_build_context_synchronously
    showBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Termos de Uso',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              Html(data: term),
            ],
          ),
        ),
      ),
    );
  }

  void openPrivacyPolicy(BuildContext context) async {
    final service = GetIt.I<GetTermsAndPolicyService>();
    final policy = await service('Policy');

    // ignore: use_build_context_synchronously
    showBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Política de Privacidade',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              Html(data: policy),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Ao clicar em "$actionText", você concorda com os nossos ',
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: 'Termos de Uso',
              recognizer: TapGestureRecognizer()
                ..onTap = () => openTerms(context),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(text: ' e '),
            TextSpan(
              text: 'Política de Privacidade.',
              recognizer: TapGestureRecognizer()
                ..onTap = () => openPrivacyPolicy(context),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
