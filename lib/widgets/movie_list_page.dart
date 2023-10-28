import 'package:app/model/movie.dart';
import 'package:app/widgets/counter.dart';
import 'package:app/widgets/movie_list_item.dart';
import 'package:app/widgets/rate_buttons.dart';
import 'package:app/common/rate_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _BORDER_COLOR = Color.fromARGB(255, 225, 225, 225);
const _HORIZONTAL_GAP = 20.0;
const _SIZE_BOX_HEIGHT = 50.0;
const _TEXT_INPUT_LIMIT = 15;
const _VERTICAL_MARGIN = 10.0;

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final List<Movie> _movies = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildMoviesListHeader(),
        _buildMoviesListBody(),
      ],
    );
  }

  Widget _buildMoviesListHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: _VERTICAL_MARGIN),
      padding: const EdgeInsets.symmetric(horizontal: _HORIZONTAL_GAP),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: _BORDER_COLOR)),
      ),
      child: Column(
        children: [
          _buildTextField(),
          _buildCountersBox(),
        ],
      ),
    );
  }

  Widget _buildMoviesListBody() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: _movies.length,
        itemBuilder: (_, index) {
          final name = _movies[index].name;
          return MovieListItem(
            name: name,
            rateButtons: RateButtons(
              currentRate: _movies[index].rate,
              onRateChanged: (newRate) {
                setState(
                    () => _movies[index] = Movie(name: name, rate: newRate));
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(_TEXT_INPUT_LIMIT),
      ],
      decoration: const InputDecoration(hintText: 'Enter movie name'),
      onFieldSubmitted: (value) => {
        if (value.trim().isEmpty ||
            _movies.map((movie) => movie.name).contains(value))
          {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Movie name is empty or already exists'),
              ),
            )
          }
        else
          {
            setState(
              () {
                _movies.insert(0, Movie(name: value, rate: null));
              },
            )
          }
      },
    );
  }

  Widget _buildCountersBox() {
    return SizedBox(
      height: _SIZE_BOX_HEIGHT,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: Rate.values
            .map(
              (rate) => Counter(
                  count: _movies.where((movie) => movie.rate == rate).length,
                  label: rate),
            )
            .toList(),
      ),
    );
  }
}
