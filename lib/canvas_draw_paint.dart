import 'package:flutter/material.dart';
import 'package:flutterapp/animation_processing.dart';

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
      home: new MyFadeTest(title: 'Sample App'),
    );
  }
}