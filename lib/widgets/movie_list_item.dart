import 'package:app/widgets/rate_buttons.dart';
import 'package:flutter/material.dart';

const _FONT_SIZE = 17.0;
const _HORIZONTAL_GAP = 12.0;
const _MOVIE_LIST_ITEM_HEIGHT = 50.0;
const _VERTICAL_MARGIN = 6.0;

class MovieListItem extends StatelessWidget {
  final String name;
  final RateButtons rateButtons;

  const MovieListItem(
      {super.key, required this.name, required this.rateButtons});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _MOVIE_LIST_ITEM_HEIGHT,
      margin: const EdgeInsets.symmetric(vertical: _VERTICAL_MARGIN),
      padding: const EdgeInsets.symmetric(horizontal: _HORIZONTAL_GAP),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: _FONT_SIZE,
            ),
          ),
          rateButtons
        ],
      ),
    );
  }
}
