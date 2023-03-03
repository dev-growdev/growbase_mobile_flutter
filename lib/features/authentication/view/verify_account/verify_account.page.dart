import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../shared/view/widgets/body_layout.widget.dart';
import '../../../../shared/view/widgets/custom_snackbars.widget.dart';
import '../../../../shared/view/widgets/primary_button.widget.dart';
import '../../../../shared/view/widgets/rich_text_button.widget.dart';
import 'verify_account.store.dart';

class VerifyAccountPage extends StatefulWidget {
  final String login;
  final void Function() onSuccess;
  const VerifyAccountPage({
    Key? key,
    required this.login,
    required this.onSuccess,
  }) : super(key: key);

  @override
  State<VerifyAccountPage> createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage> {
  final store = VerifyAccountStore(
    sendVerificationCodeService: GetIt.I(),
    verifyAccountService: GetIt.I(),
  );

  void next() async {
    FocusScope.of(context).unfocus();
    final result = await store.verifyAccount(widget.login);

    if (result) {
      widget.onSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: BodyLayout(
        hasAppBar: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Código de confirmação',
              style: theme.textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Coloque o código de confirmação enviado ao ',
                style: theme.textTheme.bodyMedium,
                children: [
                  const TextSpan(
                    text: 'e-mail ',
                  ),
                  TextSpan(
                    text: widget.login,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Observer(builder: (context) {
              return _PinCode(
                onChanged: store.setPin,
                errorText: store.failure?.message,
              );
            }),
            const SizedBox(height: 32),
            Observer(builder: (context) {
              return PrimaryButton(
                text: 'Confirmar',
                onPressed: next,
                isLoading: store.isLoading,
              );
            }),
            const SizedBox(height: 32),
            _ResendCode(
              actionResendCode: () => store.sendCode(widget.login),
            ),
          ],
        ),
      ),
    );
  }
}

class _PinCode extends StatelessWidget {
  final void Function(String) onChanged;
  final String? errorText;

  const _PinCode({
    Key? key,
    required this.onChanged,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PinCodeTextField(
          appContext: context,
          length: 5,
          onChanged: onChanged,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            fieldHeight: size.width > 340 ? 60 : 50,
            fieldWidth: size.width > 340 ? 60 : 50,
            borderWidth: 1,
            // activeColor: const Color(0xFFC4C4C4),
            activeColor: errorText != null
                ? theme.colorScheme.error
                : theme.colorScheme.primary,
            selectedColor: errorText != null
                ? theme.colorScheme.error
                : const Color(0xFFC4C4C4),
            inactiveColor: errorText != null
                ? theme.colorScheme.error
                : const Color(0xFFC4C4C4),
            borderRadius: BorderRadius.circular(6),
          ),
          animationType: AnimationType.fade,
          animationDuration: const Duration(milliseconds: 300),
          cursorColor: const Color(0xFF444444),
          cursorHeight: 25,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          dialogConfig: DialogConfig(
            dialogTitle: 'Colar o código',
            dialogContent: 'Você deseja colar esse código ',
            affirmativeText: 'Colar',
            negativeText: 'Cancelar',
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              errorText!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }
}

class _ResendCode extends StatefulWidget {
  final Future<bool> Function() actionResendCode;
  const _ResendCode({
    Key? key,
    required this.actionResendCode,
  }) : super(key: key);

  @override
  State<_ResendCode> createState() => __ResendCodeState();
}

class __ResendCodeState extends State<_ResendCode> {
  late Timer _timer;
  int _timerValue = 60;
  bool _isActiveTimer = true;

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _initializeTimer() {
    _isActiveTimer = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerValue != 0) {
          _timerValue--;
        } else {
          timer.cancel();

          _isActiveTimer = false;
          _timerValue = 60;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _isActiveTimer
        ? Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: RichText(
              text: TextSpan(
                text: 'Tente novamente em ',
                style: theme.textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: '$_timerValue ',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'segundos',
                    style: theme.textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          )
        : RichTextButton(
            firstText: 'Não recebeu o código? ',
            secondText: 'Enviar novamente.',
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);

              final result = await widget.actionResendCode();

              if (!result) {
                _initializeTimer();
                messenger.showSnackBar(
                  SuccessSnackBar(
                    text: 'Código enviado com sucesso!',
                  ),
                );
              } else {
                messenger.showSnackBar(
                  ErrorSnackBar(
                    text: 'Ocorreu um erro ao enviar o código!',
                  ),
                );
              }
            },
          );
  }
}
