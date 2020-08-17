import 'package:flutter/material.dart';
import 'dart:convert';
import 'langbrain.dart';
import 'databrain.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: camel_case_types
class Content_Listing extends StatelessWidget {
  final Lang data;

  Content_Listing({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffcc0000),
        title: Text(
          data.appBarTitle,
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: data.lang == "mm"
                    ? Text("မာတိကာ")
                    : Text("Table of Contents"),
              ),
            ),
            Expanded(
              flex: 16,
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString("load-json/content_data${data.lang}.json"),
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
                                            backgroundColor: Color(0xffcc0000),
                                            child: Text(
                                              mydata[index]['index'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17.0),
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
                      color: Color(0xffcc0000),
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
