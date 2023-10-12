import 'package:app/widgets/counter.dart';
import 'package:app/widgets/movie_list_item.dart';
import 'package:app/widgets/rate_buttons.dart';
import 'package:app/common/rate_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _textInputLimit = 15;

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final List<Counter> counters = [
    Counter(label: RateState.good),
    Counter(label: RateState.bad)
  ];
  final List<MovieListItem> movies = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Color.fromARGB(255, 225, 225, 225))),
            ),
            child: Column(children: [
              TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(_textInputLimit),
                  ],
                  decoration:
                      const InputDecoration(hintText: 'Enter movie name'),
                  onFieldSubmitted: (value) => {
                        if (value.trim().isNotEmpty)
                          {
                            setState(() {
                              movies.add(_buildMovieListItem(value));
                            })
                          }
                      }),
              SizedBox(
                height: 50.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        counters.map((counter) => counter.display()).toList()),
              )
            ])),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              verticalDirection: VerticalDirection.up,
              children: movies,
            ),
          ),
        )
      ],
    );
  }

  _buildMovieListItem(String name) {
    return MovieListItem(
        name: name,
        rateButtons: RateButtons(
            rateCallbacks: Map.fromEntries(
          RateState.values.map(
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
