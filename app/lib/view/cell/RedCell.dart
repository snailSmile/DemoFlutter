import 'package:flutter/material.dart';

class RedCell extends StatefulWidget {
  final String text;
  final int counter;
  final VoidCallback onPressed;
  const RedCell({super.key, required this.text, required this.counter, required this.onPressed});

  @override
  State<RedCell> createState() => _RedCellState();
}

class _RedCellState extends State<RedCell> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('啊阿啊阿啊阿啊===red==${widget.text}');

    
  }

  @override
  Widget build(BuildContext context) {
    print('啊阿啊阿啊阿啊===red==${widget.text}===build');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.red,
                  child: Text(
                    widget.text,
                    style: const TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.left,
                    maxLines: null,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: widget.onPressed,
                child: Text('{${widget.counter}}'),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.red,
          indent: 16.0,
          endIndent: 16.0,
        ),
      ],
    );
  }
}
