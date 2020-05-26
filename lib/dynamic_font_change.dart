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
        title: new Text("Flutter App",
          textAlign:TextAlign.start ,
        style: TextStyle(
          fontSize: 20,
          color: Colors.green
        ),),
      ),
      body: new Center(child: new Text(textToShow,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
        color: Colors.black,
        backgroundColor: Colors.green,
        decoration: TextDecoration.underline,
        decorationColor: Colors.grey,
        decorationStyle: TextDecorationStyle.dashed
      ),)),
      floatingActionButton: new FloatingActionButton(
        onPressed: _updateText,
        tooltip: "Update Text",
        child: new Image.asset('images/icon_yladfs.png'),
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
