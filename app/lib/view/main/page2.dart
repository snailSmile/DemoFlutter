import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FXTP/view/cell/RedCell.dart';
import 'package:FXTP/view/cell/BlueCell.dart';
import 'package:FXTP/view/cell/imageCell.dart';
import 'package:FXTP/view/cell/imageTextCell.dart';

class page2 extends StatefulWidget {
  final String title;
  final List<dynamic> items;
  final bool isLoading;
  final Future<void> Function() refreshCallBack;
  final ScrollController scrollController;
  final String moduleId;
  const page2({
    super.key,
    required this.title,
    required this.items,
    required this.isLoading,
    required this.refreshCallBack,
    required this.scrollController,
    required this.moduleId,
  });

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            automaticallyImplyLeading: false,
          ),
          body: RefreshIndicator(
            onRefresh: widget.refreshCallBack,
            child: ListView.builder(
              controller: widget.scrollController,
              itemCount: widget.items.length + (widget.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == widget.items.length) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  print("当前滚动的index=======$index");
                  if (index % 4 == 0) {
                    return RedCell(
                        text: 'index=== widget.items[index]===$index',
                        counter: _counter,
                        onPressed: _incrementCounter);
                  } else if (index % 4 == 1) {
                    return imageCell(itemIndex: index);
                  } else if (index % 4 == 2) {
                    return ImageTextCell(itemIndex: index);
                  } else {
                    return BlueCell(text: 'widget.items[index]===$index');
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}

/*
Widget buildPage2(
    String title,
    List<dynamic> items,
    bool isLoading,
    Future<void> Function() refreshCallback,
    ScrollController scrollController) {

  return CupertinoTabView(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          automaticallyImplyLeading: false,
        ),
        body: RefreshIndicator(
          onRefresh: refreshCallback,
          child: ListView.builder(
            controller: scrollController,
            itemCount: items.length + (isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == items.length) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                if (index % 2 == 0) {
                  return RedCell(text: items[index], counter: _counter, onPressed: _incrementCounter);
                } else {
                  return BlueCell(text: items[index]);
                }
              }
            },
          ),
        ),
      );
    },
  );
}
*/