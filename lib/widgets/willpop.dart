import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool> onBackButtonPressed(BuildContext context) async {
  bool exit = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Really?"),
        content: const Text('Do you want to close app'),
        actions: [
          TextButton(
            onPressed: () {
              (Navigator.of(context).pop(false));
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text('yes'),
          ),
        ],
      );
    },
  );
  return exit ?? false;
}
