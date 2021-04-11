import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tomsarry/widgets/drawer_wrapper_widget.dart';

class PortfolioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerWrapperWidget(
      Column(
        children: [
          // first element
          Padding(
            padding: EdgeInsets.fromLTRB(24, 17, 24, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Avg. Gain',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '€25, weekly',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(width: 18),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: const Color(0xFFD4D5D8),
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // delimiter
          Container(
              height: 1,
              width: double.infinity,
              color: const Color(0xFFF3F3F4)),
          // second element
          Padding(
            padding: EdgeInsets.fromLTRB(24, 17, 24, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Portfolio Performance',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MultiplierIcon(multiplier: 2),
                    SizedBox(width: 18),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: const Color(0xFFD4D5D8),
                      size: 14,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MultiplierIcon extends StatelessWidget {
  // replace colors
  const MultiplierIcon({this.multiplier});

  final int multiplier;
  final Color bgColor = const Color(0xFFEFF4FD);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)), color: bgColor),
        child: Center(
          child: Text(
            '${multiplier}x',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
