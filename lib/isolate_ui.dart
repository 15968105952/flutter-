import 'dart:convert';//json解析
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;//联网操作
import 'dart:async';//异步处理
import 'dart:isolate';//与AsyncTask一样，在Flutter中，可以利用多个CPU内核来执行耗时或计算密集型任务
import 'package:flutterapp/strings.dart';//引用String文件

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
          title: new Text(Strings.title),
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

    setState(() {
      widgets=msg;
    });
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

  Future sendReceive(SendPort sendPort, msg) {
    ReceivePort receivePort = new ReceivePort();
    sendPort.send([msg, receivePort.sendPort]);
    return receivePort.first;
  }
}
