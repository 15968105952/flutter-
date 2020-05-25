import 'package:flutter/material.dart';
//动画处理
class MyFadeTest extends StatefulWidget {
  var title;
  MyFadeTest({Key key, this.title}) : super(key: key);

  @override
  _MyFadeTestState createState() => new _MyFadeTestState();
}

class _MyFadeTestState extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Container(
          child: new FadeTransition(
            opacity: curve,
            child: new FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: "Fade",
        child: new Icon(Icons.brush),
        onPressed: (){
          controller.forward();
        },
      ),
    );
  }
}
