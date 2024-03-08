import 'package:flutter/material.dart';

class ImageTextCell extends StatefulWidget {
  final int itemIndex;
  ImageTextCell({required this.itemIndex});
  @override
  State<ImageTextCell> createState() => _ImageTextCellState();
}

class _ImageTextCellState extends State<ImageTextCell> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('天文知识介绍==${widget.itemIndex}'),
          Image(image: AssetImage('044_天文.png')),
          Text('天文知识系统处理结束'),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
