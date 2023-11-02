import 'package:app/common/movie_notifier.dart';
import 'package:app/widgets/text_edit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateMovieSection extends StatelessWidget {
  final int movieIndex;
  const UpdateMovieSection({super.key, required this.movieIndex});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<MovieNotifier>();
    return TextEdit(
      title: 'Edit movie name',
      onTextChanged: (value) => notifier.setMovie(
          movieIndex, value, notifier.movies[movieIndex].rate),
    );
  }
}
