import 'package:flutter/material.dart';
import 'dart:convert';
import 'modal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Modal modal = new Modal();

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 11,
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('load-json/about.json'),
                builder: (context, snapshot) {
                  var mydata = jsonDecode(snapshot.data.toString());
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Text(
                              "" + mydata[index]['title'],
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            new Text("" + mydata[index]['text']),
                            SizedBox(
                              height: 20.0,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: mydata.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => modal.mainBottomSheet(context),
        child: FaIcon(FontAwesomeIcons.googlePlay),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
