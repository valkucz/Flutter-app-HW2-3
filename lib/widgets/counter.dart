import 'package:app/common/rate_enum.dart';
import 'package:app/common/rate_style.dart';
import 'package:app/common/movie_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _FONT_SIZE = 16.0;

class Counter extends StatelessWidget {
  final int count;
  final Rate rate;
  const Counter({super.key, required this.count, required this.rate});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<MovieNotifier>();
    return TextButton(
      onPressed: () => notifier.setFilter(rate),
      style: TextButton.styleFrom(
          backgroundColor: notifier.currentRate == rate
              ? RateStyle.colors[rate]
              : Colors.white),
      child: Text(
        '${rate.name.toUpperCase()}: $count',
        style: TextStyle(
            color: notifier.currentRate == rate
                ? Colors.white
                : RateStyle.colors[rate],
            fontSize: _FONT_SIZE,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
