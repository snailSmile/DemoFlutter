import 'package:flutter/material.dart';

class BlueCell extends StatelessWidget {
  final String text;

  BlueCell({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.0),
            color: Colors.blue,
            child: Text(
              text,
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.left,
              maxLines: null,
            ),
          ),
        ),
        const Divider(
          color: Colors.green,
          indent: 16.0,
          endIndent: 16.0,
        ),
      ],
    );
  }
}
