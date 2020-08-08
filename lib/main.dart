import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'launcher_worker.dart';
import 'route_generator.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() => runApp(MyApp());
LauncherWorker launcherWorker = LauncherWorker();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LandingPage(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: ClipPath(
                clipper: WaveClipperTwo(flip: true),
                child: Container(
                  height: 600,
                  width: 500,
                  color: Colors.redAccent,
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          "အများပြည်သူလေ့လာအသုံးပြုနိုင်ရန်\n ပွင့်လင်းမြန်မာ့ရှေ့ဆောင်မှ အခမဲ့ ဖြန့်ချီသည်။",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: 240,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      )
                    ],
                  )),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Image(
                      image: AssetImage('images/landingicon.png'),
                      width: 70.0,
                      height: 70.0,
                    ),
                  ),
                  Text(
                    "ရပ်ကွက် (သို့မဟုတ်) ကျေးရွာ အုပ်ချုပ်ရေးဥပဒေ",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/aboutus'),
                    icon: FaIcon(FontAwesomeIcons.questionCircle),
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.redAccent,
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/content_listing'),
                    child: Text("စဖတ်ရန်")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
