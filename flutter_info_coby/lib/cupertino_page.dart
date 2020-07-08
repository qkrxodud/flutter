import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CupertinoPageState();

}

class _CupertinoPageState extends State<CupertinoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        CupertinoButton(
          child: Text('쿠퍼티노 버튼'),
        )
      ],
    );
  }
  
}