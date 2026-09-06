import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final void Function(int val) onCreate;

  const TextFieldWidget({super.key, required this.onCreate});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            for (final i in [1, 2, 3])
              ElevatedButton(
                onPressed: () {
                  widget.onCreate(i);
                },
                child: Text('$i'),
              ),
          ],
        ),
      ],
    );
  }
}
