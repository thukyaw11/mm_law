import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Modal {
  mainBottomSheet(BuildContext context, lang) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext content) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: lang == "mm"
                    ? Text(
                        "ပွင့်လင်းမြန်မာ့ရှေ့ဆောင်မှ Mobile App များ",
                        style: TextStyle(fontSize: 15.0),
                      )
                    : Text(
                        "Mobile Apps from OMI",
                        style: TextStyle(fontSize: 15.0),
                      ),
              ),
              _createTile(
                  context,
                  lang == "eng"
                      ? 'The Ward or Village Tract Administration Law'
                      : 'ရပ်/ကျေးအုပ်ချုပ်ရေးဥပဒေ'),
              _createTile(
                  context, lang == "eng" ? 'Voter Education' : 'မဲပေး ပညာပေး'),
            ],
          );
        });
  }

  ListTile _createTile(BuildContext context, String name) {
    return ListTile(
        leading: FaIcon(FontAwesomeIcons.googlePlay), title: Text(name));
  }
}
