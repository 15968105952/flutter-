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
      body:new Center(
          child:new DefaultTextStyle(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
                letterSpacing: 1,// 单词之间的距离
                wordSpacing: 3,// 字母之间的距离
                fontWeight: FontWeight.bold,// 字体的权重, bold 是粗字体, normal正常字体
              ), child: Column(
            children: <Widget>[
              Text(
                textToShow,
                style: TextStyle(
                  //这里我们重新指定一下颜色，那么最终的颜色就以子节点的设置为准
                    color: Colors.deepOrange
                ),
              ),
              Text(
                textToShow,
                style: TextStyle(
                    inherit: false,//inherit设为false表示不继承父节点默认样式，默认值为true
                    color: Colors.orange
                ),
              ),
              Text(
                textToShow,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "我们",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20
                  )
                ),
                TextSpan(
                  text: "打篮球"
                )
              ]))
            ],
          ))
      ),
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
