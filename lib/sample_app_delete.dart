import 'package:flutter/material.dart';

//动态删除和改变组件
class SampleAppDelete extends StatefulWidget {
  SampleAppDelete({Key key}) : super(key: key);

  @override
  _SampleAppDeleteState createState() => new _SampleAppDeleteState();
}

class _SampleAppDeleteState extends State<SampleAppDelete> {
  // Default value for toggle
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return new Text('Toggle One');
    } else {
      return new MaterialButton(onPressed: () {}, child: Icon(Icons.search));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}