import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'langbrain.dart';
import 'dart:convert';
import 'launcher_worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class LandingPage extends StatelessWidget {
  LauncherWorker launcherWorker = LauncherWorker();
  final Lang data;

  LandingPage({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                Widget>[
          Expanded(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("load-json/landing_page${data.lang}.json"),
              // ignore: missing_return
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var mydata = jsonDecode(snapshot.data.toString());
                  return Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClipPath(
                          clipper: OvalBottomBorderClipper(),
                          child: Container(
                            height: 300.0,
                            width: 500,
                            color: Color(0xffcc0000),
                            child: Container(
                                child: Column(
                              children: <Widget>[
                                SizedBox(height: 40),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40.0),
                                    child: Text(
                                      mydata['AppName'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Image(
                                image: AssetImage('images/landingicon.png'),
                                width: 70.0,
                                height: 70.0,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              mydata['SharingStatus'],
                              style: TextStyle(fontSize: 14.0),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            FlatButton(
                              child: Text(
                                mydata['aboutUsText'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: () => Navigator.of(context).pushNamed(
                                  '/aboutus',
                                  arguments: Lang(lang: data.lang)),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              width: 240,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                      icon: FaIcon(FontAwesomeIcons.facebook),
                                      iconSize: 19,
                                      onPressed: launcherWorker.launchURL,
                                      color: Colors.black38),
                                  IconButton(
                                      icon: FaIcon(FontAwesomeIcons.envelope),
                                      iconSize: 19,
                                      color: Colors.black38,
                                      onPressed: launcherWorker.launchMail),
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.phone),
                                    iconSize: 19,
                                    onPressed: launcherWorker.launchPhone,
                                    color: Colors.black38,
                                  ),
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.mapMarker),
                                    iconSize: 19,
                                    color: Colors.black38,
                                    onPressed: launcherWorker.launchLocation,
                                  ),
                                  IconButton(
                                    icon: FaIcon(FontAwesomeIcons.globe),
                                    iconSize: 19,
                                    color: Colors.black38,
                                    onPressed: launcherWorker.launchWeb,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          onPressed: () {
                            if (data.lang == "mm") {
                              Navigator.of(context).pushNamed(
                                  '/content_listing',
                                  arguments: Lang(
                                      lang: data.lang,
                                      appBarTitle:
                                          "ရပ်ကွက် (သို့မဟုတ်) ကျေးရွာအုပ်ချုပ်ရေးဥပဒေ"));
                            } else {
                              Navigator.of(context).pushNamed(
                                  '/content_listing',
                                  arguments: Lang(
                                      lang: data.lang,
                                      appBarTitle:
                                          "The Ward or Village Tract Administration Law"));
                            }
                          },
                          // onPressed: () => Navigator.of(context).pushNamed(
                          //   '/content_listing',
                          //   arguments: Lang(
                          //       lang: data.lang,
                          //       appBarTitle: "This is app bar title"
                          //       ),
                          // ),
                          padding: EdgeInsets.all(0),
                          child: ClipPath(
                            clipper: OvalTopBorderClipper(),
                            child: Container(
                              height: 600,
                              width: 500,
                              color: Color(0xffF4433A),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    mydata['StartText'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return SpinKitSquareCircle(
                    color: Colors.redAccent,
                    size: 50.0,
                  );
                }
              },
            ),
          )
        ]),
      ),
    );
  }
}
