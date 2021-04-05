import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tomsarry/models/home_controller.dart';

class Home extends StatefulWidget {

  final String title;

  Home({
    Key key,
    this.title,
  }) : super (key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();

}

class _HomeState extends State<Home> {

  HomeController _controller = HomeController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }


  /// TODO (tomsarry) : Please fill this out
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}