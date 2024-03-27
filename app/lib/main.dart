// import 'dart:html';

import 'dart:convert';

import 'package:FXTP/tool/Color.dart';
import 'package:FXTP/view/main/page3.dart';
import 'package:FXTP/view/main/page5.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:FXTP/net/request.dart';
import 'package:FXTP/view/cell/BlueCell.dart';
import 'package:FXTP/view/cell/RedCell.dart';
import 'package:FXTP/model/Album.dart';
import 'package:FXTP/my_data_table.dart';
import 'package:FXTP/tool/CustomBarView.dart';
import 'package:FXTP/view/main/page2.dart';
import 'package:FXTP/view/main/page3.dart';
import 'package:FXTP/view/main/page5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'this is a text'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late List<String> items;
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  int _selectedIndex = 0;
  late Widget _currentPage;
  Color randomColor = generateRandomColor();
  //网络请求
  // late Future<List<BottomNavigationBarItem>> _bottomBarItemsFutures;
  late Future<List<CustomBarItem>> _bottomBarItemsFutures;
  List<CustomBarItem> _bottomBarItems = []; // 实际存储底部导航栏数据的列表

  @override
  void initState() {
    super.initState();
    items = List.generate(
        10,
        (index) =>
            'Item ${'a' * (index * 10)}'); // Generate strings with the same content but different length
    _tabController = TabController(length: 5, vsync: this);
    _scrollController.addListener(_onScroll);
    _bottomBarItemsFutures = fetchBottomBarItems('1'); //获取底部导航栏数据
    _bottomBarItemsFutures.then((value) => {
          setState(() {
            _bottomBarItems = value;
          }),
        });
    //_
  }

  Widget _buildPage(int index) {
    CustomBarItem? item; // 将item声明为可空类型

    // 检查_bottomBarItems是否为空，如果不为空则设置item为对应索引的元素
    _bottomBarItems.isNotEmpty ? item = _bottomBarItems[index] : item = null;
    // 打印item的id或提示没有数据
    if (item != null) {
      print("${item.id}");
    } else {
      print("还没有数据");
    }

    String moduleId = _bottomBarItems.isNotEmpty ? _bottomBarItems[index].id : "123456789";


    switch (index) {
      case 0:
        return _buildPage1(index);
      case 1:
        return page2(
          title: widget.title,
          items: items,
          isLoading: _isLoading,
          refreshCallBack: _refresh,
          scrollController: _scrollController,
          moduleId: moduleId, // 传递item.id，如果item为null，则传递null
        );
      case 2:
        return _buildTab2();
      case 3:
        return page3(moduleId: moduleId,);
      default:
        return const page5();
    }
  }


  Future<List<CustomBarItem>> fetchBottomBarItems(String title) async {
    try {
      String responseBody = await fetchData(
          'https://jsonplaceholder.typicode.com/albums', {'title': title});
      return _parseCustomBarItems(responseBody);
    } catch (error) {
      print("Error occurred : $error");
      return _defaultCustomBarItems();
    }
  }

  List<CustomBarItem> _parseCustomBarItems(String responseBody) {
    final List<dynamic> data = json.decode(responseBody);
    return List<CustomBarItem>.from(data.map((e) {
      return CustomBarItem(
        icon: Image.network(
          e['icon'],
          width: MediaQuery.of(context).size.width / 5.0,
          height: MediaQuery.of(context).size.width / 5.0 -
              MediaQuery.of(context).padding.bottom,
        ),
        activeIcon: Image.network(
          e['iconSelected'],
          width: MediaQuery.of(context).size.width / 5.0,
          height: MediaQuery.of(context).size.width / 5.0 -
              MediaQuery.of(context).padding.bottom,
        ),
        id: e['id'],
      );
    }));
  }

  List<CustomBarItem> _defaultCustomBarItems() {
    const String responseBody = '''
        [
      {
        "Text": "aaa",
        "id": "1706495663655194627",
        "icon": "https://fxtp-ziyuan.oss-cn-shanghai.aliyuncs.com/app/index/new_2023/0627/shouye_0628.png",
        "iconSelected": "https://fxtp-ziyuan.oss-cn-shanghai.aliyuncs.com/app/index/new_2023/0627/shouye2_0628.png"
      },
      {
        "Text": "mmm",
        "id": "1706495718277615619",
        "icon": "https://fxtp-ziyuan.oss-cn-shanghai.aliyuncs.com/app/index/new_2023/0627/xiangfuwu_0628.png",
        "iconSelected": "https://fxtp-ziyuan.oss-cn-shanghai.aliyuncs.com/app/index/new_2023/0627/xiangfuwu2_0628.png"
      },
      {
        "Text": "qqq",
        "id": "1706495760992407555",
        "icon": "https://ecloudcdn.tppension.cntaiping.com/fxtpplatform/fxtpstatic/uploads/resourcebit_file/202312/15/e61153bf61684b3d97e21f8766b55994.png",
        "iconSelected": "https://ecloud.tppension.cntaiping.com/fxtpplatform/fxtpstatic/uploads/resourcebit_file/202307/28/55d9bca624264e718f3c71c1ff78b8b5.png"
      },
      {
        "Text": "kkk",
        "id": "1706495798908915714",
        "icon": "https://fxtp-ziyuan.oss-cn-shanghai.aliyuncs.com/app/module/xx_on_0925.png",
        "iconSelected": "https://fxtp-ziyuan.oss-cn-shanghai.aliyuncs.com/app/module/xx_0925.png"
      },
      {
        "Text": "hhh",
        "id": "1706495840717737987",
        "icon": "https://fxtp-ziyuan.oss-cn-shanghai.aliyuncs.com/app/index/new_2023/0627/wd_0628.png",
        "iconSelected": "https://fxtp-ziyuan.oss-cn-shanghai.aliyuncs.com/app/index/new_2023/0627/wd2_0628.png"
      }
    ] ''';
    return _parseCustomBarItems(responseBody);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  //增
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //上拉加载更多
  Future<void> _loadMore() async {
    // Simulate a delay for loading more data
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      // Append more items to the list
      items.addAll(
          List.generate(10, (index) => "More Item ${items.length + index}"));
      _isLoading = false;
    });
  }

  //刷新
  Future<void> _refresh() async {
    // Simulate a delay for refreshing data
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // Replace items with new data
      items = List.generate(20, (index) => "Refreshed Item $index");
    });
  }

  //滚动监听
  void _onScroll() {
    print(
        "刷新ing：($_isLoading)======pixels:($_scrollController.position.pixels)=====max:($_scrollController.position.maxScrollExtent)");
    if (!_isLoading &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
      setState(() {
        _isLoading = true;
      });
      _loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("当前 _selectedIndex 的值是: $_selectedIndex");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: _buildPage(_selectedIndex),
      bottomNavigationBar: FutureBuilder<List<CustomBarItem>>(
        future: _bottomBarItemsFutures,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("这是当前aaaaaa==========");
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print("这是当前bbbbbb==========");
            return Center(
              child: Text('error:${snapshot.error}'),
            );
          } else {
            print("这是当前cccccc==========$_selectedIndex");
            return CustomBarView(
              items: snapshot.data!,
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                  _currentPage = _buildPage(index);
                  print("这是当前qqqqqq==========$index======$_selectedIndex");
                });
              },
            );
          }
        },
      ),
    );
  }



  Widget _buildPage1(int index) {
    return Scaffold(
      body: CupertinoTabView(
        builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter=====$index',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            bottomNavigationBar: const SizedBox(
              height: kBottomNavigationBarHeight + 88,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTab2() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab 2'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                // maxLength: 13,
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontSize: 20),
                inputFormatters: [
                  phoneInputFormatter(),
                  LengthLimitingTextInputFormatter(13),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // 按钮点击事件
      //   },
      //   child: Icon(Icons.add_sharp),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  TextInputFormatter phoneInputFormatter() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      String text = newValue.text;
      //获取光标左边的文本
      final positionStr = (text.substring(0, newValue.selection.baseOffset))
          .replaceAll(RegExp(r"\s+\b|\b\s"), "");
      //计算格式化后的光标位置
      int length = positionStr.length;
      var position = 0;
      if (length <= 3) {
        position = length;
      } else if (length <= 7) {
        // 因为前面的字符串里面加了一个空格
        position = length + 1;
      } else if (length <= 11) {
        // 因为前面的字符串里面加了两个空格
        position = length + 2;
      } else {
        // 号码本身为 11 位数字，因多了两个空格，故为 13
        position = 13;
      }
      print('打印之前的数据========$text');
      //这里格式化整个输入文本
      text = text.replaceAll(RegExp(r"\s+\b|\b\s"), "");
      print('打印之后的数据========$text');
      var string = "";
      for (int i = 0; i < text.length; i++) {
        // 这里第 4 位，与第 8 位，我们用空格填充
        if (i == 3 || i == 7) {
          if (text[i] != " ") {
            string = "$string ";
          }
        }
        string += text[i];
      }
      print('打印之后的数据遍历数据========$string');
      return TextEditingValue(
        text: string,
        selection: TextSelection.fromPosition(
            TextPosition(offset: position, affinity: TextAffinity.upstream)),
      );
    });
  }






 
   

