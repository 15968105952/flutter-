import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:isolate';

void main() => runApp(new SampleApp());

class SampleApp extends StatelessWidget {
  // StatelessWidget 无状态
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //动态删除和改变组件
//      home: new SampleAppDelete(),
      //动态改变字体
//      home: new SampleAppPage(),
      //页面跳转
//      home: new PageOne(),
      //动画处理
//      home: new MyFadeTest(title: 'Sample App'),
      //如何使用Canvas draw/paint,未成功，待完善
//    home:new Scaffold(
//      body: new DemoApp(),
//    )
      //自定义按钮
//    home: new Center(
//      child: new CustomButton("hello"),
//    ),
      //异步UI
      home: new IsolateUI(),
    );
  }
}

class IsolateUI extends StatefulWidget {
  IsolateUI({Key key}) : super(key: key);

  @override
  _IsolateUIState createState() => new _IsolateUIState();
}

class _IsolateUIState extends State<IsolateUI> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: getBody());
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }

    return false;
  }

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int position) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text("${widgets[position]["title"]}"));
  }

  void loadData() async {
    ReceivePort receivePort = new ReceivePort();
    await Isolate.spawn(dataloader, receivePort.sendPort);

    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(
        sendPort, "https://jsonplaceholder.typicode.com/posts");
  }

  static dataloader(SendPort sendPort) async {
    ReceivePort receivePort = new ReceivePort();
    sendPort.send(receivePort.sendPort);
    await for (var msg in receivePort) {
      String data = msg[0];
      SendPort replyTo = msg[1];
      String dataURL = data;
      http.Response response = await http.get(dataURL);
      replyTo.send(json.decode(response.body));
    }
  }

  Future sendReceive(SendPort sendPort, String msg) {
    ReceivePort receivePort = new ReceivePort();
    sendPort.send([msg, receivePort.sendPort]);
    return receivePort.first;
  }
}
