import 'package:flutter/material.dart';
import 'package:leeta/views/login.dart';

class PleaseLoginAlertDialog extends StatelessWidget {
  const PleaseLoginAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('You must be logged in to continue.'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text('Login')),
      ],
    );
  }
}
