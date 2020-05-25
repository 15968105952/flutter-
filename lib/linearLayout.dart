import 'package:flutter/material.dart';

class LinearLayout extends StatefulWidget {

  @override
  _LinearLayoutState createState() => new _LinearLayoutState();
}

class _LinearLayoutState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child:  new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Column One'),
          new Text('Column Two'),
          new Text('Column Three'),
          new Text('Column Four'),
        ],
      ),
    );
  }
}