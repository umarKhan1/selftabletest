import 'package:flutter/material.dart';

import 'views/homeviewimport.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selftabletest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Roboto"
      ),
      home: const Homeview(),
    );
  }
}

