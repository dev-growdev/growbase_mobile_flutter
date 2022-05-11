import 'package:flutter/material.dart';
import 'package:agmais_mobile/themes/light.theme.dart';
import 'package:agmais_mobile/injection_container.dart' as di;

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
      title: 'AGMais',
      theme: lightTheme(context),
      home: NewWidget(),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste'),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: OutlinedButton(
            child: Text('Navegar'),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => TesteWidget()));
            },
          ),
        ),
      ),
    );
  }
}

class TesteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Segunda página'),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                child: Text('Avançar'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => TesteWidget()));
                },
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
        ),
      ),
    );
  }
}
