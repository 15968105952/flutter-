import 'package:flutter/material.dart';

//动态改变字体
class SampleAppPage extends StatefulWidget {
  // StatefulWidget 有状态，数值可变

  SampleAppPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text
  String textToShow = "I Like Flutter";
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter App"),
      ),
      body: new Center(child: new Text(textToShow)),
      floatingActionButton: new FloatingActionButton(
        onPressed: _updateText,
        tooltip: "Update Text",
        child: new Icon(Icons.update,color: Colors.pink,),
      ),
    );
  }

  //改变字体
  void _updateText() {
    setState(() {
      isChange = !isChange;
      if (isChange)
        textToShow = "Flutter is Awesome!";
      else
        textToShow = "I Like Flutter";
    });
  }
}