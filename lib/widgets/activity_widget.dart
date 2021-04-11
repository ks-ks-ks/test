import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tomsarry/widgets/drawer_wrapper_widget.dart';

class ActivityWidget extends StatefulWidget {
  @override
  _ActivityWidgetState createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  bool _isExtended = false;

  void _toggleExtended() {
    setState(() {
      _isExtended = !_isExtended;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      child: DrawerWrapperWidget(
        AnimatedContainer(
          height: _isExtended ? 352 : 88,
          duration: Duration(milliseconds: 450),
          curve: Curves.fastOutSlowIn,
          child: Column(
            children: [
              AnimatedPadding(
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                // reduce padding when opened
                padding: EdgeInsets.fromLTRB(
                  24,
                  _isExtended ? 19 : 24,
                  24,
                  _isExtended ? 18 : 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    FaIcon(
                      // ! COULD NOT FIND CORRECT ICON
                      FontAwesomeIcons.chevronRight,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
              Container(
                height: _isExtended ? 1 : 0,
                color: const Color(0xFFF3F3F4),
              ),
            ],
          ),
        ),
      ),
      onTap: _toggleExtended,
    );
  }
}
