import 'package:flutter/material.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            TextFormField(
                decoration: const InputDecoration(
              hintText: 'Enter movie name',
              // TODO: add onSaved
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_buildRateCounter('GOOD'), _buildRateCounter('BAD')],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRateCounter(String label) {
    const counter = 0;
    return Text('$label: $counter');
  }
}

// State
class Counter {
  final String label;
  final int count;

  const Counter({required this.label, required this.count});
}
