import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterWidget extends StatelessWidget {
  Widget swapButtonWidget(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: AlignmentDirectional.bottomStart,
              end: AlignmentDirectional.topEnd,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ],
            ),
          ),
        ),
        FaIcon(
          FontAwesomeIcons.exchangeAlt,
          size: 20,
          color: Theme.of(context).backgroundColor,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      height: 86,
      child: Padding(
        // place button at the top of the container
        padding: EdgeInsets.fromLTRB(0, 0, 0, 34),
        child: Center(
          child: swapButtonWidget(context),
        ),
      ),
    );
  }
}
