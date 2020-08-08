import 'package:flutter/material.dart';

class Modal {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext content) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Apps from OMI",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              _createTile(
                  context, 'ရပ်/ကျေး အုပ်ချုပ်ရေးဥပဒေ', Icons.file_download),
              _createTile(context, 'voter education', Icons.file_download),
            ],
          );
        });
  }

  ListTile _createTile(BuildContext context, String name, IconData icon) {
    return ListTile(leading: Icon(icon), title: Text(name));
  }
}
