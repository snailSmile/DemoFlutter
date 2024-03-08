import 'package:flutter/material.dart';

class imageCell extends StatefulWidget {
  final int itemIndex;

  imageCell({required this.itemIndex});
  @override
  State<imageCell> createState() => _imageCellState();
}

// ignore: camel_case_types
class _imageCellState extends State<imageCell> {

  @override
  void initState() {
    super.initState();
    _fectchData();
  }

  void _fectchData() {
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text('data===${widget.itemIndex}'),
        const Image(image: AssetImage('assets/love.png')),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
