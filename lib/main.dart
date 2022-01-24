import 'package:flutter/material.dart';

void main() {
  runApp(const WardApp());
}

class WardApp extends StatelessWidget {
  const WardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'W.A.R.D.',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
      ),
      home: const Scaffold(),
    );
  }
}
