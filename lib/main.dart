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
//      home: new MyFadeTest(title: 'Sample App'),
      //如何使用Canvas draw/paint
    home:new Scaffold(
      body: new DemoApp(),
    )
    );
  }
}

class DemoApp extends StatelessWidget {
  Widget build(BuildContext context) => new Scaffold(body: new Signature());
}

class Signature extends StatefulWidget {
  SignatureState createState() => new SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails details){
        setState(() {
          RenderBox referenceBox=context.findRenderObject();
          Offset localPosition=referenceBox.globalToLocal(details.globalPosition);
          _points=new List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details)=>_points.add(null)
      ,
      child: new CustomPaint(painter: new SignaturePainter(_points)),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset> points;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint=new Paint()
    ..color=Colors.black
        ..strokeCap=StrokeCap.round
        ..strokeWidth=5.0;
    for(int i=0;i<points.length-1;i++){
      if(points[i]!=null&&points[i+1]!=null){
        canvas.drawLine(points[i], points[i+1], paint);
      }
    }

  }

  @override
  bool shouldRepaint(SignaturePainter  oldDelegate) =>oldDelegate.points!=points;
}