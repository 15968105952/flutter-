import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapp/animation_processing.dart';
import 'package:flutterapp/canvas_draw_paint.dart';
import 'package:flutterapp/custom_button.dart';
import 'package:http/http.dart' as http;
import 'package:flutterapp/asynchronous_ui.dart';

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
      home: new AsynchronousUI(),
    );
  }
}

