import 'package:flutter/material.dart';

const _movieListItemHeight = 50.0;
const _horizontalGap = 12.0;
const _verticalMargin = 6.0;
const _fontSize = 17.0;

class MovieListItem extends StatelessWidget {
  final String name;
  final Widget rateButtons;
  const MovieListItem(
      {super.key, required this.name, required this.rateButtons});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _movieListItemHeight,
        margin: const EdgeInsets.symmetric(vertical: _verticalMargin),
        padding: const EdgeInsets.symmetric(horizontal: _horizontalGap),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name,
                style: const TextStyle(
                  fontSize: _fontSize,
                )),
            rateButtons,
          ],
        ));
  }
}
