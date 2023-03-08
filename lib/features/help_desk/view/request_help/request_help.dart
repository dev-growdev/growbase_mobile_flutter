import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/view/widgets/body_layout.widget.dart';
import '../../../../shared/view/widgets/custom_snackbars.widget.dart';
import '../../../../shared/view/widgets/primary_button.widget.dart';
import 'request_help.store.dart';

class RequestHelpPage extends StatefulWidget {
  const RequestHelpPage({super.key});

  @override
  State<RequestHelpPage> createState() => _RequestHelpPageState();
}

class _RequestHelpPageState extends State<RequestHelpPage> {
  final store = RequestHelpStore(GetIt.I());

  void send(BuildContext context) async {
    final form = Form.of(context);
    if (!form.validate()) return;
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    final result = await store.requestHelp();

    messenger.showSnackBar(
      result
          ? SuccessSnackBar(
              text: 'Sua dúvida foi enviada com sucesso.',
            )
          : ErrorSnackBar(
              text:
                  'Não foi possível enviar sua dúvida. - ${store.failure?.message}',
            ),
    );

    if (result) navigator.pop();
  }

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
              Observer(builder: (_) {
                return TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Descreva sua dúvida da melhor forma possível',
                    errorText: store.failure?.message,
                  ),
                  keyboardType: TextInputType.multiline,
                  onChanged: store.setMessage,
                  maxLines: 5,
                  validator: (text) {
                    if (text == null || text.length < 10) {
                      return 'A mensagem está muito curta';
                    }

                    return null;
                  },
                );
              }),
              const SizedBox(height: 32),
              Observer(builder: (context) {
                return PrimaryButton(
                  text: 'Enviar dúvida',
                  onPressed: () {},
                  isLoading: store.isLoading,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
