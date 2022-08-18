import 'package:flutter/material.dart';
import 'package:flutter_portfolio/UI/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Danilo Lima',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
