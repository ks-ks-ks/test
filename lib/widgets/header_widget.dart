import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tomsarry/models/home_controller.dart';
import 'package:tomsarry/widgets/gradient_bg.dart';

class SendButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor.withOpacity(0.07),
            shape: BoxShape.circle,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: FaIcon(
              // ! could not find proper icon
              FontAwesomeIcons.paperPlane,
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Send',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  final HomeController _homeController = HomeController();
  int _currentPage = 0;

  get homeController => null;

  void _setCurrentPage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  // shows inactive page dot with small opacity
  double getOpacity(int page) {
    if (page == _currentPage) {
      return 1;
    }
    return 0.2;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 100),
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
              // smaller text when app bar shrinks
              fontSize: constraints.maxHeight < 160 ? 24 : 44,
              fontFamily: 'Aleo',
              fontWeight: FontWeight.w700,
            ),
            child: Container(
              child: GradientBg(
                height: 352,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedOpacity(
                          // get dot color
                          opacity: getOpacity(0),
                          duration: Duration(milliseconds: 100),
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        // space between dots
                        SizedBox(width: 8),
                        AnimatedOpacity(
                          // get dot color
                          opacity: getOpacity(1),
                          duration: Duration(milliseconds: 100),
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Scrollable area: change currency
                    Container(
                      height: 60,
                      // scroll between curencies
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: _setCurrentPage,
                        children: <Widget>[
                          Center(
                            child: Text(_homeController.portfolioValueEur()),
                          ),
                          Center(
                            child: Text(_homeController.portfolioValueBtc()),
                          ),
                        ],
                      ),
                    ),

                    // conditionally render the send button for big height
                    AnimatedOpacity(
                      // ! get overflow warning if scrolls too fast
                      // first make button disappear
                      opacity: constraints.maxHeight > 300.0 ? 1 : 0,
                      // then replace button by animated container that will shrink
                      child: constraints.maxHeight < 290.0
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              height: constraints.maxHeight < 250.0 ? 0 : 76)
                          : SendButtonWidget(),
                      duration: Duration(
                        milliseconds: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}
