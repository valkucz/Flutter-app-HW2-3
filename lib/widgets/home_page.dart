import 'package:app/widgets/add_movie_section.dart';
import 'package:app/widgets/movie_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AddMovieSection()),
              );
            },
          )
        ],
      ),
      body: const MovieListPage(),
    );
  }
}
