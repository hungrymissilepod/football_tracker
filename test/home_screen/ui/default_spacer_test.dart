import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/home_screen/ui/default_spacer.dart';

void main() {

  testWidgets('Check UI of DefaultSpacer', (WidgetTester tester) async {
    await tester.pumpWidget(const DefaultSpacer());

    final Finder finder = find.byType(SizedBox);
    final SizedBox sizedBox = tester.firstWidget(finder);
    
    expect(finder, findsOneWidget);
    expect(sizedBox.height, 30);
  });
}