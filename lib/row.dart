import 'package:flutter/material.dart';

//class LayoutDemo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 800.0,
//      width: 400.0,
//      padding:EdgeInsets.only(top: 60),
//      color: Colors.pink,
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,//主轴的排序方式
//        crossAxisAlignment: CrossAxisAlignment.start,//次轴的排序方式
//        children: <Widget>[
//          IconContainer(Icons.search,color: Colors.blue),
//          IconContainer(Icons.home,color: Colors.orange),
//          IconContainer(Icons.select_all,color: Colors.red),
//        ],
//      ),
//    );
//  }
//}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(//用Container进行
      color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: IconContainer(Icons.search, color: Colors.blue),
            ),
            Expanded(
              flex: 2,
              child: IconContainer(Icons.home, color: Colors.orange),
            ),
            Expanded(
              flex: 1,
              child: IconContainer(Icons.select_all, color: Colors.red),
            ),
          ],
        )
    );
  }
}

//class LayoutDemo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//
//        Row(
//          children: <Widget>[
//            Expanded(
//              child:Container(
//                height: 180,
//                color: Colors.black,
//                child: Center(
//                  child: Text("这是头部",
//                  style: TextStyle(
//                    color: Colors.orange,
//                    fontSize: 30,
//                  ),),
//                ),
//              ),
//            )
//          ],
//        ),
//        Row(
//          children: <Widget>[
//            Expanded(
//                flex: 2,
//                child: Container(
//                  height: 180,
//                  child: Image.network("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2606512668,2361120991&fm=27&gp=0.jpg",fit: BoxFit.cover),
//                )
//            ),
//            SizedBox(width: 10),
//            Expanded(
//                flex: 1,
//                child: Container(
//                    height: 180,
//                    child: ListView(
//                      children: <Widget>[
//                        Container(
//                          height: 85,
//                          child: Image.network("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2606512668,2361120991&fm=27&gp=0.jpg",fit: BoxFit.cover),
//
//                        ),
//                        SizedBox(height: 10),
//                        Container(
//                          height: 85,
//                          child: Image.network("https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2191520521,2689315141&fm=27&gp=0.jpg",fit: BoxFit.cover),
//                        )
//                      ],
//                    )
//                )
//            ),
//
//          ],
//        )
//      ],
//    );
//  }
//}

class IconContainer extends StatelessWidget {
  double size = 32.0;
  Color color = Colors.red;
  IconData icon;


  IconContainer(this.icon, {this.color, this.size});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100.0,
      width: 100.0,
      color: this.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //主轴居中对齐
          crossAxisAlignment: CrossAxisAlignment.center, //交叉轴居中对齐
          children: <Widget>[
            Icon(this.icon, size: this.size, color: Colors.white),
            Text(
              "这是搜索按钮",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                decoration:
                TextDecoration.none, //Expanded会使text带有双下划线，添加此方法去除下划线
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
