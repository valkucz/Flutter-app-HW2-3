import 'package:app/common/rate_style.dart';
import 'package:flutter/material.dart';
import 'package:app/common/rate_enum.dart';

const _fontSize = 16.0;

class Counter {
  final Rate label;
  int _count = 0;
  Counter({required this.label});

  increment() => _count++;
  decrement() => _count--;

  Widget display() => Text('${label.name.toUpperCase()}: $_count',
      style: TextStyle(
          color: RateStyle.colors[label],
          fontSize: _fontSize,
          fontWeight: FontWeight.bold));
}
