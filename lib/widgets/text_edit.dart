import 'package:app/common/movie_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

const _TEXT_INPUT_LIMIT = 15;

class TextEdit extends StatefulWidget {
  final String title;
  final Function(String) onTextChanged;
  const TextEdit({super.key, required this.title, required this.onTextChanged});

  @override
  TextEditState createState() => TextEditState();
}

class TextEditState extends State<TextEdit> {
  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<MovieNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(_TEXT_INPUT_LIMIT),
          ],
          decoration: const InputDecoration(hintText: 'Enter movie name'),
          onFieldSubmitted: (value) => {
            if (value.trim().isEmpty ||
                notifier.movies.map((movie) => movie.name).contains(value))
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Movie name is empty or already exists'),
                  ),
                )
              }
            else
              {widget.onTextChanged(value), Navigator.of(context).pop()}
          },
        ),
      ),
    );
  }
}
