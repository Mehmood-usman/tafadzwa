import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> isInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

alertDialoge(String? message, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Task"),
          content: Text(message!),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              }, // passing true
              child: const Text("Okay"),
            )
          ],
        );
      });
}
