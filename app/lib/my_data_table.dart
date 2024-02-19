import 'package:flutter/material.dart';

class MyDataTable extends StatefulWidget {
  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  int _counter = 0; // 假设这是你的数据

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