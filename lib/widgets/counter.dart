import 'package:app/common/rate_enum.dart';
import 'package:app/common/rate_style.dart';
import 'package:flutter/material.dart';

const _FONT_SIZE = 16.0;

class Counter extends StatelessWidget {
  final int count;
  final Rate label;
  const Counter({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${label.name.toUpperCase()}: $count',
      style: TextStyle(
          color: RateStyle.colors[label],
          fontSize: _FONT_SIZE,
          fontWeight: FontWeight.bold),
    );
  }
}
