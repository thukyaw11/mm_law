import 'package:flutter/material.dart';
import 'dart:convert';
import 'databrain.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Content_Listing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "ရပ်ကွက် သို့မဟုတ် ကျေးရွာအုပ်ချုပ်ရေးဥပဒေ",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: Text("မာတိကာ"),
              ),
            ),
            Expanded(
              flex: 16,
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('load-json/content_data.json'),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var mydata = jsonDecode(snapshot.data.toString());
                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              new Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                child: Wrap(
                                  children: <Widget>[
                                    FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () =>
                                          Navigator.of(context).pushNamed(
                                        '/content_list_view',
                                        arguments: Data(
                                            title: mydata[index]['title'],
                                            content: mydata[index]['content'],
                                            subtitle: mydata[index]
                                                ['subtitle']),
                                      ),
                                      child: Card(
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.redAccent,
                                            child: Text(
                                              mydata[index]['index'],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          title: Text(mydata[index]['title']),
                                          subtitle: Text(
                                            mydata[index]['subtitle'],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: mydata.length,
                    );
                  } else {
                    return SpinKitSquareCircle(
                      color: Colors.redAccent,
                      size: 50.0,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
