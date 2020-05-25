import 'package:flutter/material.dart';

//动画处理
class GestureDetectorSample extends StatefulWidget {
  GestureDetectorSample({Key key}) : super(key: key);

  @override
  GestureDetectorSampleTest createState() => new GestureDetectorSampleTest();
}


class GestureDetectorSampleTest extends State<GestureDetectorSample> with TickerProviderStateMixin  {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//      body: new Center(
//        child: new GestureDetector(
//          child: new FlutterLogo(
//            size: 200.0,
//          ),
//          //点击
//          onTap: (){
//            print("tap");
//          },
//        ),
//      ),
//    );
//  }
  AnimationController controller;
  CurvedAnimation curve;
  @override
  void initState() {
    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child: new GestureDetector(
            child: new RotationTransition(
                turns: curve,
                child: new FlutterLogo(
                  size: 100.0,
                )),
            onDoubleTap: () {
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward();
              }
            },
          ),
        ));
  }

}


