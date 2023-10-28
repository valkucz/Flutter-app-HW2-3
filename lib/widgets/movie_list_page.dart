import 'package:app/common/movie_notifier.dart';
import 'package:app/widgets/counter.dart';
import 'package:app/widgets/movie_list_item.dart';
import 'package:app/widgets/rate_buttons.dart';
import 'package:app/common/rate_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _SIZE_BOX_HEIGHT = 50.0;

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<MovieNotifier>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildCountersBox(notifier),
        _buildMoviesListBody(notifier),
      ],
    );
  }

  Widget _buildMoviesListBody(MovieNotifier notifier) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: notifier.movies.length,
        itemBuilder: (_, index) {
          final name = notifier.movies[index].name;
          return MovieListItem(
            name: name,
            index: index,
            rateButtons: RateButtons(
              currentRate: notifier.movies[index].rate,
              onRateChanged: (rate) => notifier.setMovie(index, name, rate),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCountersBox(MovieNotifier notifier) {
    return SizedBox(
      height: _SIZE_BOX_HEIGHT,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: Rate.values
            .map(
              (rate) => Counter(
                  count: notifier.getMoviesWithRate(rate).length, rate: rate),
            )
            .toList(),
      ),
    );
  }
}
