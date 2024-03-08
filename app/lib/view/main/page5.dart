import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fxtp_app/net/request.dart';

class page5 extends StatefulWidget {
  const page5({super.key});

  @override
  State<page5> createState() => _page5State();
}

class _page5State extends State<page5> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchPage5Data();
  }

  Future<void> _fetchPage5Data() async {
    try {
      String responseBody = await fetchData(
          'https://ecloudsit.tppension.cntaiping.com/fxtpplatform/position/anonymous/position/resourcePosition/findResourceByModuleId?language=zh-CN',
          {"moduleId": "1706495663655194627"});
      //数据处理
      final List<dynamic> data = json.decode(responseBody);
      print('数据返回$data');
    } catch (e) {
      print('Error fetching data: $e');
      // 或者 throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('page5index=$index'),
          );
        },
      ),
    );
  }
}
