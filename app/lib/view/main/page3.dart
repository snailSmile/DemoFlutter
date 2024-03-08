import 'package:flutter/material.dart';
import 'package:fxtp_app/view/widget/loadMore.dart';

class ItemWidget extends StatelessWidget {
  final String text;
  final int count;
  final Function() onTap;

  ItemWidget({required this.text, required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page3()),
        );
      },
      child: ListTile(
        title: Text(text),
        trailing: ElevatedButton(
          onPressed: onTap,
          child: Text('$count'),
        ),
      ),
    );
  }
}

class page3 extends StatefulWidget {
  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  List<String> items = [];
  List<int> counts = List.generate(30, (index) => 0); // 初始数量列表，假设有10个ItemWidget
  bool isLoading = false;
  late ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    _fetchData();
  }

  void _fetchData() async {
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    const delta = 100.0;
    if (maxScroll - currentScroll <= delta && !isLoading) {
      setState(() {
        isLoading = true;
      });
      _loadMoreData();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: counts.length + 1,
        itemBuilder: (context, index) {
          print("当前滚动的index==pagethree=====$index");
          if (index < counts.length) {
            return ItemWidget(
              text: 'Item $index',
              count: counts[index],
              onTap: () {
                setState(() {
                  counts[index]++; // 点击时增加对应ItemWidget的数量
                });
              },
            );
          } else {
            return buildLoadMoreIndiactor();
          }
        },
      ),
    );
  }

  Future<void> _loadMoreData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      counts.addAll(List.generate(10, (index) => 0));
      isLoading = false;
    });
  }
}
