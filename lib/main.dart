import 'package:flutter/material.dart';
import 'package:qbachat/Screen/homescreen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QbaChat',
      theme: ThemeData(
        fontFamily: "OpenSans",
        primarySwatch: Colors.indigo,


      ),
      home: Homescreen(),
    );
  }
}

