import 'package:app/model/movie.dart';
import 'package:app/common/movie_notifier.dart';
import 'package:app/widgets/text_edit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMovieSection extends StatelessWidget {
  const AddMovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<MovieNotifier>();
    return TextEdit(
      title: 'Add movie',
      onTextChanged: (value) => notifier.addMovie(
        Movie(name: value, rate: null),
      ),
    );
  }
}
