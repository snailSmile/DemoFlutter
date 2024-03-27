import 'package:flutter/material.dart';
// import 'package:auto_size_text/auto_size_text.dart';

class MyDataTable extends StatefulWidget {
  const MyDataTable({super.key});

  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  int _counter = 0; // 假设这是你的数据

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

//处理刷新
//处理表格不全屏还有自定义表格，和刷新
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            print('Refreshing...'); // 添加打印语句
            // 模拟刷新操作
            await Future.delayed(const Duration(seconds: 1));
            setState(() {}); // 刷新界面
            print('方法调用了');
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                const Center(
                  child: Text('You have pushed the button this many times:'),
                ),
                Center(
                  child: Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  // alignment: Alignment.center,
                  child: datatable(),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: _incrementCounter,
                      child: const Icon(Icons.onetwothree)),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DataTable datatable() {
    return DataTable(
      columnSpacing: 10,
      dataRowMaxHeight: 120,
      columns: const <DataColumn>[
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: Text('Description'),
        ),
      ],
      rows: List<DataRow>.generate(
        10,
        (index) => DataRow(
          cells: [
            DataCell(
              Text('Item $index'),
            ),
            DataCell(
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 200,
                ),
                child: Text(
                  'This is a description for item $index. It could be a long text that needs to wrap.',
                  maxLines: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
  DataTable datatable() {
    return DataTable(
      horizontalMargin: 10, // 水平边距设为 0
      columnSpacing: 0, // 列之间间距设为 0
      dataRowMaxHeight: 190,
      dataRowMinHeight: 10,
      columns: const <DataColumn>[
        DataColumn(
            label: Text(
          'Name',
          textAlign: TextAlign.center,
        )),
        // DataColumn(
        //     label: Text(
        //   'Age111',
        //   textAlign: TextAlign.right,
        // )),
      ],
      rows: const <DataRow>[
        DataRow(cells: [
          DataCell(
            Expanded(
              child: Text(
                '组件多多少少',
                maxLines: null,
              ),
            ),
          ),
          // DataCell(Text(
          //   '30',
          // )),
        ]),
        DataRow(cells: [
          DataCell(
            Expanded(
              child: Text(
                '2222\n22244441\n1111111111\nJohn并且使用 Divider 组件2\nJohn并且使用 Divider 组件3\nJohn并且使用 Divider 组件多多少少',
                maxLines: null,
              ),
            ),
          ),
          // DataCell(Text(
          //   '30',
          // )),
        ]),
        DataRow(cells: [
          DataCell(
            Expanded(
              child: Text(
                '11111111111John并且使用 Divider 组件2\nJohn并且使用 Divider 组件3\nJohn并且使用 Divider 组件多多少少',
                maxLines: null,
              ),
            ),
          ),
          // DataCell(Text('1')),
        ]),
        // 添加更多的数据行
      ],
    );
  }
  }
  */


/*
//另外一种刷新方式
//只适合ios的风格在安卓上没有效果
  Future<void> _refreshData() async {
    // 模拟刷新操作
    await Future.delayed(Duration(seconds: 1));
    setState(() {}); // 刷新界面
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: _refreshData,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Center(
                  child: Text('You have pushed the button this many times:'),
                ),
                Center(
                  child: Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.center,
                  child: DataTable(
                    horizontalMargin: 0,
                    columnSpacing: 0,
                    columns: const <DataColumn>[
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Age')),
                    ],
                    rows: <DataRow>[
                      DataRow(cells: [
                        DataCell(Text('John')),
                        DataCell(Text('30')),
                      ]),
                      // 添加更多的数据行
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

*/
/*
//处理表格不全屏还有自定义表格，和刷新
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: RefreshIndicator(
                  onRefresh: () async {
                    print('Refreshing...'); // 添加打印语句
                    // 模拟刷新操作
                    await Future.delayed(Duration(seconds: 1));
                    setState(() {}); // 刷新界面
                    print('方法调用了');
                  },
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      Center(
                        child:
                            Text('You have pushed the button this many times:'),
                      ),
                      Center(
                        child: Text(
                          '$_counter',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        child: DataTable(
                          horizontalMargin: 0, // 水平边距设为 0
                          columnSpacing: 0, // 列之间间距设为 0
                          columns: const <DataColumn>[
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Age111')),
                          ],
                          rows: <DataRow>[
                            DataRow(cells: [
                              DataCell(Text('John')),
                              DataCell(Text('30')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('1')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('2')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('3')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('4')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('5')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('6')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('7')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('8')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('8.1')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('8.2')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('9')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('9.1')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('9.2')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('10')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('11')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('12')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('13')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('14')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('15')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('16')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('17')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('18')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('19')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('20')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('21')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('22')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('23')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('24')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('25')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('26')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('27')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('28')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('29')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('30')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('31')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('32')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('33')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('34')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('35')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('36')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('37')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('38')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('39')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('40')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('41')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('42')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('43')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('44')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('45')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('46')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('47')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('48')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('49')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('50')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('51')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('52')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('53')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('54')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('55')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('56')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('57')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('58')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('59')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('60')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('61')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('62')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('63')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('64')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('65')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('66')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('67')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('68')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('69')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('70')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('71')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('72')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('73')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('74')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('75')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('76')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('77')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('78')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Doe')),
                              DataCell(Text('79')),
                            ]),
                            // 添加更多的数据行
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: ElevatedButton(
                            onPressed: _incrementCounter,
                            child: const Icon(Icons.onetwothree)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
/*
//任务完成：一个跟随表格滑动的按钮
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: RefreshIndicator(
                  onRefresh: () async {
                    // 模拟刷新操作
                    await Future.delayed(Duration(seconds: 1));
                    setState(() {}); // 刷新界面
                  },
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      Center(
                        child:
                            Text('You have pushed the button this many times:'),
                      ),
                      Center(
                        child: Text(
                          '$_counter',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      const SizedBox(height: 20),
                      DataTable(
                        horizontalMargin: 0, // 水平边距设为 0
                        columnSpacing: 0, // 列之间间距设为 0
                        columns: const <DataColumn>[
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Age111')),
                        ],
                        rows: <DataRow>[
                          DataRow(cells: [
                            DataCell(Text('John')),
                            DataCell(Text('30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('1')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('2')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('3')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('4')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('5')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('6')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('7')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('8')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('8.1')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('8.2')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('9')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('9.1')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('9.2')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('10')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('11')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('12')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('13')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('14')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('15')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('16')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('17')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('18')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('19')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('20')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('21')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('22')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('23')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('24')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('25')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('26')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('27')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('28')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('29')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('30')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('31')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('32')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('33')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('34')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('35')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('36')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('37')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('38')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('39')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('40')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('41')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('42')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('43')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('44')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('45')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('46')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('47')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('48')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('49')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('50')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('51')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('52')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('53')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('54')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('55')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('56')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('57')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('58')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('59')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('60')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('61')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('62')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('63')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('64')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('65')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('66')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('67')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('68')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('69')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('70')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('71')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('72')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('73')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('74')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('75')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('76')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('77')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('78')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Doe')),
                            DataCell(Text('79')),
                          ]),
                          // 添加更多的数据行
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: ElevatedButton(
                            onPressed: _incrementCounter,
                            child: const Icon(Icons.onetwothree)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
/*
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // 在这里添加你的刷新逻辑，比如从网络获取数据等
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          // 这里更新数据并重绘界面
          _counter++;
        });
      },
      child: DataTable(
        columns: [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Age')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('John')),
            DataCell(Text('30')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('1')),
          ]),
          // 添加更多的数据行
        ],
      ),
    );
  }
}
*/

/*floatingActionButton按钮
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () async {
              // 模拟刷新操作
              await Future.delayed(Duration(seconds: 1));
              setState(() {}); // 刷新界面
            },
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'You have pushed the button this many times:',
                  ),
                ),
                Center(
                  child: Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                const SizedBox(height: 20),
                DataTable(
                  horizontalMargin: 0, // 水平边距设为 0
                  columnSpacing: 0, // 列之间间距设为 0
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Age111')),
                  ],
                  rows: <DataRow>[
                    DataRow(cells: [
                      DataCell(Text('John')),
                      DataCell(Text('30')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('1')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('2')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('3')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('4')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('5')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('6')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('7')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('8')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('8.1')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('8.2')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('9')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('9.1')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('9.2')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('10')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('11')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('12')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('13')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('14')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('15')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('16')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('17')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('18')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('19')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('20')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('21')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('22')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('23')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('24')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('25')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('26')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('27')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('28')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('29')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('30')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('31')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('32')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('33')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('34')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('35')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('36')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('37')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('38')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('39')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('40')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('41')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('42')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('43')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('44')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('45')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('46')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('47')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('48')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('49')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('50')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('51')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('52')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('53')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('54')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('55')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('56')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('57')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('58')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('59')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('60')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('61')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('62')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('63')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('64')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('65')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('66')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('67')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('68')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('69')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('70')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('71')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('72')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('73')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('74')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('75')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('76')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('77')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('78')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Doe')),
                      DataCell(Text('79')),
                    ]),
                    // 添加更多的数据行
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.onetwothree),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: SizedBox(
      //   height:
      //       kBottomNavigationBarHeight + 30, // 底部导航栏高度 + FloatingActionButton高度
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
  }
}
*/


/*
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // 在这里添加你的刷新逻辑，比如从网络获取数据等
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          // 这里更新数据并重绘界面
          _counter++;
        });
      },
      child: DataTable(
        columns: [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Age')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('John')),
            DataCell(Text('30')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('1')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('2')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('3')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('4')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('5')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('6')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('7')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('8')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('8.1')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('8.2')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('9')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('9.1')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('9.2')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('10')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('11')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('12')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('13')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('14')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('15')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('16')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('17')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('18')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('19')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('20')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('21')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('22')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('23')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('24')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('25')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('26')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('27')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('28')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('29')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('30')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('31')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('32')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('33')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('34')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('35')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('36')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('37')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('38')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('39')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('40')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('41')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('42')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('43')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('44')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('45')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('46')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('47')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('48')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('49')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('50')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('51')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('52')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('53')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('54')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('55')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('56')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('57')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('58')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('59')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('60')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('61')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('62')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('63')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('64')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('65')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('66')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('67')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('68')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('69')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('70')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('71')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('72')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('73')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('74')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('75')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('76')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('77')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('78')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('79')),
          ]),
          // 添加更多的数据行
        ],
      ),
    );
  }
}
*/

/*
//有报错的代码
class MyDataTable extends StatefulWidget {
  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // 这里放置刷新逻辑
        // 这里是模拟异步刷新，实际上你应该根据你的数据源进行数据加载
        await Future.delayed(Duration(seconds: 1));
        // 完成刷新
      },
      child: DataTable(
        columns: [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Age')),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('John')),
            DataCell(Text('30')),
          ]),
          DataRow(cells: [
            DataCell(Text('Doe')),
            DataCell(Text('25')),
          ]),
          // 添加更多的数据行
        ],
      ),
    );
  }
}
*/