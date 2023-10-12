import 'package:app/common/rate_state_style.dart';
import 'package:flutter/material.dart';
import 'package:app/common/rate_state.dart';

const _fontSize = 16.0;

class Counter {
  final RateState label;
  int _count = 0;
  Counter({required this.label});

  increment() => _count++;
  decrement() => _count--;

  Widget display() => Text('${label.name.toUpperCase()}: $_count',
      style: TextStyle(
          color: RateStateStyle.colors[label],
          fontSize: _fontSize,
          fontWeight: FontWeight.bold));
}
