import 'package:app/common/movie_notifier.dart';
import 'package:app/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieNotifier(),
      child: MaterialApp(
        title: 'Movies',
        theme: ThemeData(),
        home: const HomePage(),
      ),
    );
  }
}
