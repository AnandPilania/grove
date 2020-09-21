import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

_showErrorChange(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
              title: new Text('Error Change Password'),
              content: new SizedBox(
                child: Text(
                    'New Password and Confirm Password must be same.\n\nPassword must contain atleast 1 upper case letter. Password must contain atleast 1 number. \nPassword must contain atleast 1 special character.\n'),
              ),
              actions: <Widget>[
                new FlatButton(
                    child: Text(
                      "Ok",
                      style: TextStyle(color: Colors.green[800]),
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                      // AppSettings.openWIFISettings();
                    }),
              ]));
}
