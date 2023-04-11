import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Common {
  Future _ackAlert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Not in stock'),
          content: const Text('This item is no longer available'),
          actions: [
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  openDialoag(String name, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(name + ' is now a verified account'),
            title: const Text('Registration Successful'),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Verified',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          );
        });
  }

  Widget getDivider() {
    return Container(
      height: 0.5.h,
      width: 30.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black),
    );
  }
}
