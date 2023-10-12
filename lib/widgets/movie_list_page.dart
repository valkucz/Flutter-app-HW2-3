import 'package:app/widgets/counter.dart';
import 'package:app/widgets/movie_list_item.dart';
import 'package:app/widgets/rate_buttons.dart';
import 'package:app/common/rate_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _textInputLimit = 15;
const _horizontalGap = 20.0;
const _verticalMargin = 10.0;
const _borderColor = Color.fromARGB(255, 225, 225, 225);
const _sizeBoxHeight = 50.0;

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final List<Counter> counters = [
    Counter(label: Rate.good),
    Counter(label: Rate.bad)
  ];
  final List<MovieListItem> movies = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMoviesListHeader(),
        _buildMoviesListBody(),
      ],
    );
  }

  Widget _buildMoviesListHeader() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: _verticalMargin),
        padding: const EdgeInsets.symmetric(horizontal: _horizontalGap),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: _borderColor)),
        ),
        child: Column(children: [
          _buildTextField(),
          _buildCountersBox(),
        ]));
  }

  Widget _buildMoviesListBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: movies,
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(_textInputLimit),
        ],
        decoration: const InputDecoration(hintText: 'Enter movie name'),
        onFieldSubmitted: (value) => {
              if (value.trim().isNotEmpty &&
                  !movies.map((movie) => movie.name).contains(value))
                {
                  setState(() {
                    movies.add(_buildMovieListItem(value));
                  })
                }
            });
  }

  Widget _buildCountersBox() {
    return SizedBox(
      height: _sizeBoxHeight,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: counters.map((counter) => counter.display()).toList()),
    );
  }

  MovieListItem _buildMovieListItem(String name) {
    return MovieListItem(
        name: name,
        rateButtons: RateButtons(
            rateCallbacks: Map.fromEntries(
          Rate.values.map(
            (rateState) => MapEntry(
              rateState,
              {
                'increment': () =>
                    setState(() => counters[rateState.index].increment()),
                'decrement': () =>
                    setState(() => counters[rateState.index].decrement()),
              },
            ),
          ),
        )));
  }
}
