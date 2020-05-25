import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LifecycleWatcher extends StatefulWidget {
  @override
  _LifecycleWatcherState createState() => new _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcher> with WidgetsBindingObserver {
  AppLifecycleState _lastLifecyleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecyleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    String msg;
    if (_lastLifecyleState == null){
      msg="This widget has not observed any lifecycle changes.";
    }else{
      msg="The most recent lifecycle state this widget observed was: $_lastLifecyleState.";
    }
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      textColor:Colors.black,
    );

    return new Text(msg,
        textDirection: TextDirection.ltr);
  }
}

