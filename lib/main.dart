import 'package:flutter/material.dart';

import 'package:tomsarry/screens/home.dart';

/// TODO (tomsarry) : Follow the dart style guide
/// https://dart.dev/guides/language/effective-dart/style

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo for Tom Sarry',
      theme: ThemeData(
        primaryColor: Color(0xFF5B8FE7),
        backgroundColor: Colors.white,
        accentColor: Color(0xFF84ABED),
        fontFamily: 'Aleo',
      ),
      home: Home(title: 'Home'),
    );
  }
}
