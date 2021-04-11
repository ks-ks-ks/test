import 'package:flutter/material.dart';

class DrawerWrapperWidget extends StatelessWidget {
  DrawerWrapperWidget(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD4D5D8),
            blurRadius: 8,
            spreadRadius: -8,
            offset: Offset(0, 8),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(11),
        ),
      ),
      child: child,
    );
  }
}
