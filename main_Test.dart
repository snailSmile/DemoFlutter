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


/*


/*
//这段代码估计有问题
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // 设置appBar为null以隐藏导航栏
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Center(child: Text('Tab 2')),
                Center(child: Text('Tab 3')),
                Center(child: Text('Tab 4')),
                Center(child: Text('Tab 5')),
              ],
            ),
          ),
          CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                label: 'Tab1',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Tab2',
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: 'Tab3',
                icon: Icon(Icons.notifications),
              ),
              BottomNavigationBarItem(
                label: 'Tab4',
                icon: Icon(Icons.mail),
              ),
              BottomNavigationBarItem(
                label: 'Tab5',
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

*/

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
    with  {
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

    String moduleId =
        _bottomBarItems.isNotEmpty ? _bottomBarItems[index].id : "123456789";

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
        return page3(
          moduleId: moduleId,
        );
      default:
        return const page5();
    }
  }

/*代码优化
  // Future<List<BottomNavigationBarItem>> fetchBottomBarItems(
  Future<List<CustomBarItem>> fetchBottomBarItems(String title) async {
    try {
      String responseBody = await fetchData(
          'https://jsonplaceholder.typicode.com/albums', {'title': title});
      //数据处理
      final List<dynamic> data = json.decode(responseBody);
      //自定义类json转换
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
          id: e["id"],
          // label: e['Text'],
        );
        /*
        //BottomNavigationBarItem数据转化
        return List<BottomNavigationBarItem>.from(data.map((e) {
          return BottomNavigationBarItem(
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
            backgroundColor: randomColor,
            // label: e['Text'],
          );
          */
      }));
      /*
        final album = Album.fromJson(jsonDecode(resposeBody));
        return album;
        */
    } catch (e) {
      print('啊啊啊啊啊bbb=====error $e');
      throw Exception('啊啊啊啊啊ccc=====Failed to create album: $e');
    }
  }
  */

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

/*
//CupertinoTabBariOS风格tabbar接口返回
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<BottomNavigationBarItem>>(
        future: _bottomBarItemsFutures,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('error:${snapshot.error}'),
            );
          } else {
            return CupertinoTabScaffold(
              tabBar: CupertinoTabBar(items: snapshot.data!),
              tabBuilder: (context, index) {
                if (index == 0) {
                  return CupertinoTabView(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text(widget.title),
                          automaticallyImplyLeading: false, // 隐藏返回按钮
                        ),
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'You have pushed the button this many times:',
                              ),
                              Text(
                                '$_counter=====$index',
                                style: Theme.of(context).textTheme.headline6,
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
                  );
                } else if (index == 1) {
                  return CupertinoTabView(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text(widget.title),
                          automaticallyImplyLeading: false, // 隐藏返回按钮
                        ),
                        body: RefreshIndicator(
                            onRefresh: _refresh,
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: items.length + (_isLoading ? 1 : 0),
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
                                    return RedCell(text: items[index]);
                                  } else {
                                    return BlueCell(text: items[index]);
                                  }
                                }
                              },
                            )),
                      );
                    },
                  );
                } else if (index == 2) {
                  return _buildTab2();
                } else {
                  return const Center(
                    child: Text('hahaha'),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
*/
/*
//CupertinoTabBariOS风格tabbar使用
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Tab21',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Tab22',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Tab23',
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              label: 'Tab24',
              icon: Icon(Icons.mail),
            ),
            BottomNavigationBarItem(
              label: 'Tab25',
              icon: Icon(Icons.person),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
                    automaticallyImplyLeading: false, // 隐藏返回按钮
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'You have pushed the button this many times:',
                        ),
                        Text(
                          '$_counter=====$index',
                          style: Theme.of(context).textTheme.headline6,
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
                    // 底部导航栏高度 + FloatingActionButton高度
                    // child: BottomAppBar(
                    //   child: Row(
                    //     children: <Widget>[
                    //       IconButton(
                    //         icon: Icon(Icons.menu),
                    //         onPressed: () {},
                    //       ),
                    //       Spacer(),
                    //       IconButton(
                    //         icon: Icon(Icons.search),
                    //         onPressed: () {},
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                );
              },
            );
          } else if (index == 1) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
                    automaticallyImplyLeading: false, // 隐藏返回按钮
                  ),
                  body: RefreshIndicator(
                      onRefresh: _refresh,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: items.length + (_isLoading ? 1 : 0),
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
                              return RedCell(text: items[index]);
                            } else {
                              return BlueCell(text: items[index]);
                            }
                          }
                        },
                      )),
                  // floatingActionButton: FloatingActionButton(
                  //   onPressed: _incrementCounter,
                  //   tooltip: 'Increment',
                  //   child: const Icon(Icons.add),
                  // ),
                  // floatingActionButtonLocation:
                  //     FloatingActionButtonLocation.centerDocked,
                  // bottomNavigationBar: SizedBox(
                  //   height: kBottomNavigationBarHeight +
                  //       30, // 底部导航栏高度 + FloatingActionButton高度
                  //   // child: BottomAppBar(
                  //   //   child: Row(
                  //   //     children: <Widget>[
                  //   //       IconButton(
                  //   //         icon: Icon(Icons.menu),
                  //   //         onPressed: () {},
                  //   //       ),
                  //   //       Spacer(),
                  //   //       IconButton(
                  //   //         icon: Icon(Icons.search),
                  //   //         onPressed: () {},
                  //   //       ),
                  //   //     ],
                  //   //   ),
                  //   // ),
                  // ),
                );
              },
            );
          } else if (index == 2) {
            return _buildTab2();
          } else {
            return const Center(
              child: Text('hahaha'),
            );
          }
        },
      ),
    );
  }
*/

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

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              label: 'Tab1',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Tab2',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Tab3',
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              label: 'Tab4',
              icon: Icon(Icons.mail),
            ),
            BottomNavigationBarItem(
              label: 'Tab5',
              icon: Icon(Icons.person),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
                    automaticallyImplyLeading: false, // 隐藏返回按钮
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'You have pushed the button this many times:',
                        ),
                        Text(
                          '$_counter=====$index',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (index == 1) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
                    automaticallyImplyLeading: false, // 隐藏返回按钮
                  ),
                  body: MyDataTable(),
                );
              },
            );
          } else {
            return Center(
              child: Text('hahaha'),
            );
          }
        },
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
*/
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              label: 'Tab1',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Tab2',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Tab3',
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              label: 'Tab4',
              icon: Icon(Icons.mail),
            ),
            BottomNavigationBarItem(
              label: 'Tab5',
              icon: Icon(Icons.person),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
                    automaticallyImplyLeading: false, // 隐藏返回按钮
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'You have pushed the button this many times:',
                        ),
                        Text(
                          '$_counter=====$index',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  floatingActionButtonLocation: FloatingActionButtonLocation
                      .centerDocked, // 修改为 centerDocked
                );
              },
            );
          } else if (index == 1) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
                    automaticallyImplyLeading: false, // 隐藏返回按钮
                  ),
                  body: MyDataTable(),
                  floatingActionButton: FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  floatingActionButtonLocation: FloatingActionButtonLocation
                      .centerDocked, // 修改为 centerDocked
                );
              },
            );
          } else {
            return Center(
              child: Text('hahaha'),
            );
          }
        },
      ),
    );
  }
*/

/*
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            label: 'Tab1',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Tab2',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Tab3',
            icon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            label: 'Tab4',
            icon: Icon(Icons.mail),
          ),
          BottomNavigationBarItem(
            label: 'Tab5',
            icon: Icon(Icons.person),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(widget.title),
                  automaticallyImplyLeading: false, // 隐藏返回按钮
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '$_counter=====$index',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                // You can add other widgets here if needed
              );
            },
          );
        } else if (index == 1) {
          // return ListView(
          //   children: [
          //     MyDataTable(),
          //   ],
          // );
          return CupertinoTabView(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(widget.title),
                  automaticallyImplyLeading: false, // 隐藏返回按钮
                ),
                body: MyDataTable(),
                floatingActionButton: Align(
                  alignment: Alignment.topCenter,
                  child: FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: Text('hahaha'),
          );
        }
      },
      // You can add other properties here if needed
    );
  }
*/
}

/*
//iOS风格
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            label: 'Tab1',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Tab2',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Tab3',
            icon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            label: 'Tab4',
            icon: Icon(Icons.mail),
          ),
          BottomNavigationBarItem(
            label: 'Tab5',
            icon: Icon(Icons.person),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(widget.title),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
              // You can add other widgets here if needed
            );
          },
        );
      },
      // You can add other properties here if needed
    );
  }
}

*/
/*
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Center(child: Text('Tab 2view')),
                Center(child: Text('Tab 3')),
                Center(child: Text('Tab 4')),
                Center(child: Text('Tab 5')),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight * 2),
        child: Material(
          color: Colors.blue,
          child: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: 'Tab1',
              ),
              Tab(
                text: 'Tab2',
              ),
              Tab(
                text: 'Tab3',
              ),
              Tab(
                text: 'Tab4',
              ),
              Tab(
                text: 'Tab5',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height -
            kToolbarHeight -
            kBottomNavigationBarHeight -
            MediaQuery.of(context).padding.top,
        child: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            Center(child: Text('Tab 2')),
            Center(child: Text('Tab 3')),
            Center(child: Text('Tab 4')),
            Center(child: Text('Tab 5')),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: 'Tab1',
            ),
            Tab(
              text: 'Tab2',
            ),
            Tab(
              text: 'Tab3',
            ),
            Tab(
              text: 'Tab4',
            ),
            Tab(
              text: 'Tab5',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

*/


/*
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Tab 1"),
            Tab(text: "tab 2"),
            Tab(text: 'tab 3'),
          ],
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/



*/