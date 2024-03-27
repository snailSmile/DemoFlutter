import 'package:flutter/material.dart';

class BlueCell extends StatefulWidget {
  final String text;

  const BlueCell({super.key, required this.text});

  @override
  State<BlueCell> createState() => _BlueCellState();
}

class _BlueCellState extends State<BlueCell> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('啊阿啊阿啊阿啊===blue======${widget.text}');
  }

  @override
  Widget build(BuildContext context) {
    print('啊阿啊阿啊阿啊===blue==${widget.text}======你哈=');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            color: Colors.blue,
            child: Text(
              widget.text,
              style: const TextStyle(fontSize: 18.0),
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
