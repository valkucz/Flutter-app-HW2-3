import 'package:app/widgets/home_page.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movies',
        theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 168, 161, 229),
        ),
        home: const HomePage());
  }
}
