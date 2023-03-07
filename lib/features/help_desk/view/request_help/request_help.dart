import 'package:flutter/material.dart';

import '../../../../shared/view/widgets/body_layout.widget.dart';
import '../../../../shared/view/widgets/primary_button.widget.dart';

class RequestHelpPage extends StatelessWidget {
  const RequestHelpPage({super.key});

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
                'Envie sua dúvida para nossa equipe de suporte.',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Descreva sua dúvida da melhor forma possível',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'O campo não pode ser vazio';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 32),
              Builder(builder: (context) {
                return PrimaryButton(
                  text: 'Enviar dúvida',
                  onPressed: () {},
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
