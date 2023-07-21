import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../utils/constants/routes.constants.dart';
import 'splash.store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final store = SplashStore(
    savedTokenService: GetIt.I(),
    getUserService: GetIt.I(),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final navigator = Navigator.of(context);
      final isLogged = await store.userIsLogged();
      isLogged
          ? navigator.pushReplacementNamed(RoutesConstants.home)
          : navigator.pushReplacementNamed(RoutesConstants.startPage);
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
