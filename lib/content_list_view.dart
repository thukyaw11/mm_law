import 'package:flutter/material.dart';
import 'databrain.dart';
import 'package:flutter/services.dart';

class ContentListView extends StatelessWidget {
  final Data data;
  ContentListView({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final copied = ClipboardData(text: data.content);
    Clipboard.setData(copied);
    _showSnackBar() {
      print("Show Snackbar here !");
      final snackBar = new SnackBar(
          content: new Text("Copied"),
          duration: new Duration(seconds: 2),
          backgroundColor: Color(0xffcc0000));
      //How to display Snackbar ?
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(data.title),
        backgroundColor: Color(0xffcc0000),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.content_copy),
            onPressed: _showSnackBar,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          data.subtitle != ""
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data.subtitle,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                )
              : SizedBox(height: 1.0),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectableText(
                data.content,
                style: TextStyle(height: 2.0, fontSize: 18.0),
              )),
        ],
      ),
    );
  }
}
