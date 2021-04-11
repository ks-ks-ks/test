import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tomsarry/main.dart';
import 'package:tomsarry/widgets/header_widget.dart';

void main() {
  testWidgets('Header should shrink on scroll', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    Size extendedSize = tester.getSize(find.byType(HeaderWidget));
    expect(extendedSize.height, equals(352));

    await tester.drag(find.text('Send'), Offset(0, -4000));
    await tester.pump();

    Size retractedSize = tester.getSize(find.byType(HeaderWidget));

    expect(retractedSize.height, lessThan(352));
  });

  testWidgets('Send button should disappear on scroll',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Send'), findsOneWidget);

    await tester.drag(find.text('Send'), Offset(0, -4000));
    await tester.pump();

    expect(find.text('Send'), findsNothing);
  });
}
