import 'package:flutter/material.dart';

import '../../../utils/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(Routes.startPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FlutterLogo(
            size: 200,
          ),
          SizedBox(height: 32),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
