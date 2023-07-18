import 'package:flutter/material.dart';

import '../../../utils/constants/routes.constants.dart';

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
      Navigator.of(context).pushReplacementNamed(RoutesConstants.startPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
