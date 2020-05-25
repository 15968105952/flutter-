

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/isolate_ui.dart';
import 'package:flutterapp/strings.dart';
import 'package:flutterapp/dynamic_font_change.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterapp/lifecycle_watcher.dart';
import 'package:flutterapp/linearLayout.dart';
import 'package:flutterapp/gesture_detector_sample.dart';
import 'package:flutterapp/animation_processing.dart';
import 'package:flutterapp/hint_show.dart';
void main() => runApp(new SampleApp());

class SampleApp extends StatelessWidget {
  // StatelessWidget 无状态
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: Strings.title,
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
//      //异步UI
//      home: new IsolateUI(),
//        //如何监听Android Activity生命周期事件
//        home:new Center(
//           child: new LifecycleWatcher(),
//        )
        //LinearLayout在Flutter中相当于什么
//        home:new Center(
//        child: new LinearLayout(),
//    ),
        //如何处理widget上的其他手势
//        home:new Center(
//          child: new GestureDetectorSample(),
//        ),
      //Input的”hint”在flutter中相当于什么
        home:new HintShow(),
    );
  }
}

