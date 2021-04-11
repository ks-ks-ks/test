import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tomsarry/models/home_controller.dart';
import 'package:tomsarry/widgets/drawer_wrapper_widget.dart';

class BitcoinWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //putting a smaller circle underneath to have the primary color inside
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          // make it slighly smaller than icon
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: FaIcon(
            FontAwesomeIcons.bitcoin,
            // ? define in main theme ?
            // this color is used elsewhere!
            color: Color(0xFFEFF4FD),
            // fixed size for now, can take input size later if need be
            size: 40,
          ),
        )
      ],
    );
  }
}

class BitCoinPriceWidget extends StatelessWidget {
  const BitCoinPriceWidget({this.controller});
  final HomeController controller;

  Widget percentChangeWidget(bool isIncreasing) {
    final Color increasingColor = const Color(0xFF69D46E);

    // define opposite color, black for now
    final Color decreasingColor = const Color(0xFF000000);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FaIcon(
          isIncreasing
              ? FontAwesomeIcons.chevronUp
              : FontAwesomeIcons.chevronDown,
          color: isIncreasing ? increasingColor : decreasingColor,
          size: 11,
        ),
        Container(
          width: 4,
        ),
        Text(
          // stub percentage
          '2.62%',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DrawerWrapperWidget(
      Padding(
        padding: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BitcoinWidget(),
                Container(
                  width: 11,
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Aleo',
                    fontSize: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BTC',
                        style: TextStyle(
                          color: const Color(0xFFA5A7AC),
                        ),
                      ),
                      Text(
                        controller.btcPrice(),
                        style: TextStyle(
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            percentChangeWidget(true),
          ],
        ),
      ),
    );
  }
}
