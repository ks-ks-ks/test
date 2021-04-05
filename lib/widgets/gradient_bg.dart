import 'dart:math';

import 'package:flutter/material.dart';

class GradientBg extends StatelessWidget {

  final double height;
  final double width;

  GradientBg({
    Key key,
    @required this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ],
          transform: GradientRotation(
            pi/8,
          ),
        ),
      ),
    );
  }

}