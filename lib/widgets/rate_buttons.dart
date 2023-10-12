import 'package:app/common/rate_enum.dart';
import 'package:app/common/rate_style.dart';
import 'package:flutter/material.dart';

class RateButtons extends StatefulWidget {
  final Map<Rate, Map<String, Function>> rateCallbacks;

  const RateButtons({super.key, required this.rateCallbacks});

  @override
  State<RateButtons> createState() => _RateButtonsState();
}

class _RateButtonsState extends State<RateButtons> {
  Rate? _state;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: Rate.values.map((state) => _buildRateButton(state)).toList());
  }

  Widget _buildRateButton(Rate state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: _state == state
            ? ButtonStyle(
                foregroundColor:
                    const MaterialStatePropertyAll<Color>(Colors.white),
                backgroundColor:
                    MaterialStatePropertyAll<Color>(RateStyle.colors[state]!))
            : null,
        onPressed: () => {
          setState(() => {
                if (_state == null)
                  // When passing rateCallbacks to RateButtons, it is guaranteed that
                  // the map will have a key for each RateState value (as in MovieListPage._buildMovieListItem).
                  // But here it is unknown
                  {_state = state, widget.rateCallbacks[state]!['increment']!()}
                else if (_state == state)
                  {_state = null, widget.rateCallbacks[state]!['decrement']!()}
                else
                  {
                    widget.rateCallbacks[_state]!['decrement']!(),
                    widget.rateCallbacks[state]!['increment']!(),
                    _state = state
                  }
              })
        },
        child: Text(state.name.toUpperCase()),
      ),
    );
  }
}
