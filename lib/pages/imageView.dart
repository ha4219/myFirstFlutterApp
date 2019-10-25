import 'package:flutter/material.dart';

class ImageView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('처음 화면으로 돌아가기', style: TextStyle(fontSize: 21)),
          color: Colors.green,
          onPressed: () {
            Navigator.pop(context);
            // 위와 같은 코드
            // Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}