import 'package:flutter/material.dart';

class ImageTextCell extends StatefulWidget {
  final int itemIndex;
  const ImageTextCell({super.key, required this.itemIndex});
  @override
  State<ImageTextCell> createState() => _ImageTextCellState();
}

class _ImageTextCellState extends State<ImageTextCell> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('天文知识介绍==${widget.itemIndex}'),
          const Image(image: AssetImage('044_天文.png')),
          const Text('天文知识系统处理结束'),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
