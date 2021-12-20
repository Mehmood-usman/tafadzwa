import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafadzwa/screens/employee.dart';
// import 'package:tafadzwa/provider/data_provider.dart';
import 'package:tafadzwa/screens/login_screen.dart';
import 'package:tafadzwa/screens/manager.dart';

import 'screens/client.dart';

void main() {
  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => DataProvider()),
    //   ],
    //   child: MyApp(),
    // ),
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) =>Login(),
        Client.id:(context) =>const Client(),
        Employee.id:(context) =>const Employee(),
        Manager.id:(context) =>const Manager()
      },
    );
  }
}
