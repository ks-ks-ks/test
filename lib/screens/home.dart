import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tomsarry/widgets/activity_widget.dart';
import 'package:tomsarry/widgets/bitcoin_price_widget.dart';
import 'package:tomsarry/widgets/footer_widget.dart';
import 'package:tomsarry/models/home_controller.dart';
import 'package:tomsarry/widgets/header_widget.dart';
import 'package:tomsarry/widgets/portfolio_widget.dart';

class Home extends StatefulWidget {
  final String title;

  Home({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    // define status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      statusBarColor: Theme.of(context).accentColor,
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F4),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              flexibleSpace: HeaderWidget(),
              expandedHeight: 352,
              collapsedHeight: 126,
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Container(
                    margin: const EdgeInsets.only(right: 36, left: 36),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 24),
                          PortfolioWidget(),
                          SizedBox(height: 24),
                          BitCoinPriceWidget(controller: _controller),
                          SizedBox(height: 24),
                          ActivityWidget(),
                          // Give space for Footer
                          // ? Increase space when not expanded ?
                          SizedBox(height: 24),
                          SizedBox(height: 86),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: FooterWidget(),
    );
  }
}
