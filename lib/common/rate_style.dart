import 'package:app/common/rate_enum.dart';
import 'package:flutter/material.dart';

class RateStyle {
  static final Map<Rate, Color> colors = {
    Rate.good: Colors.green,
    Rate.bad: Colors.red
  };
  const RateStyle();
}
