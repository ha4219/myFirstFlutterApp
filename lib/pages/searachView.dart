import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../handler.dart';

class SearchView extends StatelessWidget {
  int _counter = 0;
  // ignore: non_constant_identifier_names
  double _icon_size = 200;
  double _radius = 50;
  double _text_field_width = 300;
  int _color= 0xFFFC6A7F;
  final String CREATE_POST_URL="";
  final TextEditingController _textController = new TextEditingController();
  ImageLinks data;

  void _showToast() {
    String msg="download";
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    Future _handleSubmitted() async {
      Post post = new Post(
          id: 0,
          userId: "0",
          searchContent: _textController.text
      );
//    data = await createPost(CREATE_POST_URL,
//        body: post.toMap());
      _textController.clear();

      Navigator.pushNamed(context, 'image');
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Container(
                  height: _icon_size,
                  width: _icon_size,
                  child: Image.asset("assets/logo.png"),
                ),
              ],
            ),

            new Container(
              width: _text_field_width,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _textController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "search"
                ),
              ),
            ),

            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              child: FloatingActionButton(
                onPressed: () => _handleSubmitted(),
                tooltip: 'search',
                backgroundColor: Color(_color),
                child: Icon(Icons.search),
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showToast,
        tooltip: 'Download',
        backgroundColor: Color(_color),
        child: Icon(Icons.file_download),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


