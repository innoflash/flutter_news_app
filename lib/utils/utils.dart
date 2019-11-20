import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';

class Utils {
  static void showAlert(BuildContext context,
      {@required String message, String title, Function onClose}) {
    if (title == null) title = Constants.APP_NAME;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            // contentPadding: EdgeInsets.all(Constants.DIMEN_10),
            title: Text('title'),
            content: Text('message'),
            actions: <Widget>[
              FlatButton(
                child: Text(Constants.OK),
                onPressed: onClose,
              )
            ],
          );
        });
  }
}
