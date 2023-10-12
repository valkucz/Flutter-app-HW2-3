import 'package:app/common/rate_state.dart';
import 'package:flutter/material.dart';

class RateStateStyle {
  static final Map<RateState, Color> colors = {
    RateState.good: const Color.fromARGB(255, 94, 166, 94),
    RateState.bad: const Color.fromARGB(255, 152, 64, 64),
  };
  const RateStateStyle();
}
