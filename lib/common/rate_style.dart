import 'package:app/common/rate_enum.dart';
import 'package:flutter/material.dart';

class RateStyle {
  static final Map<Rate, Color> colors = {
    Rate.good: const Color.fromARGB(255, 94, 166, 94),
    Rate.bad: const Color.fromARGB(255, 152, 64, 64),
  };
  const RateStyle();
}
