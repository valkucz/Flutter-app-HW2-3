import 'package:app/common/rate_enum.dart';
import 'package:app/common/rate_style.dart';
import 'package:flutter/material.dart';

class RateButtons extends StatelessWidget {
  final Rate? currentRate;
  final Function(Rate?) onRateChanged;
  const RateButtons(
      {super.key, required this.currentRate, required this.onRateChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: Rate.values.map((rate) => _buildRateButton(rate)).toList());
  }

  Widget _buildRateButton(Rate rate) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: currentRate == rate ? RateStyle.colors[rate] : null,
          foregroundColor: currentRate == rate ? Colors.white : null,
        ),
        onPressed: () => onRateChanged(rate == currentRate ? null : rate),
        child: Text(rate.name.toUpperCase()),
      ),
    );
  }
}
