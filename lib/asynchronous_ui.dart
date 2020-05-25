import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AsynchronousUI extends StatefulWidget {
  AsynchronousUI({Key key}) : super(key: key);

  @override
  _AsynchronousUIState createState() => new _AsynchronousUIState();
}

class _AsynchronousUIState extends State<AsynchronousUI> {
  List widgets = [];

  @override
  void initState() {
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
      body:new ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context,int position){
          return getRow(position);
        },
      ) ,
    );
  }

  Widget getRow(int i) {
    return new Padding(padding: new EdgeInsets.all(10.0),
      child: new Text("Row ${widgets[i]["title"]}"),);
  }

  Future loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response=await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}

