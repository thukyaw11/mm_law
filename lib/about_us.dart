import 'package:flutter/material.dart';
import 'dart:convert';
import 'modal.dart';
import 'langbrain.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Modal modal = new Modal();

class AboutUsPage extends StatelessWidget {
  final Lang data;

  AboutUsPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            data.lang == "mm" ? Text('ကျွန်ုပ်တို့အကြောင်း') : Text('About Us'),
        backgroundColor: Color(0xffcc0000),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 11,
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('load-json/about${data.lang}.json'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var mydata = jsonDecode(snapshot.data.toString());
                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              mydata[index]['bigTitle'] != null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0),
                                      child: Text(
                                        mydata[index]['bigTitle'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0.0,
                                    ),
                              Text(
                                "" + mydata[index]['title'],
                                style: TextStyle(
                                    fontSize: 20.0,
                                    height: 3.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "" + mydata[index]['text'],
                                style: TextStyle(height: 2.0, fontSize: 18.0),
                              ),
                              SizedBox(
                                height: 20.0,
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
            FlatButton(
              color: Color(0xffcc0000),
              onPressed: () => modal.mainBottomSheet(context, data.lang),
              child: RichText(
                text: TextSpan(
                  text: data.lang == "mm"
                      ? "OMI မှထုတ်ဝေခဲ့သော "
                      : "Mobile Apps from ",
                  style: TextStyle(color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                      text: data.lang == "mm" ? "Mobile App " : "OMI",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    TextSpan(
                      text: data.lang == "mm" ? " များ" : "",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
