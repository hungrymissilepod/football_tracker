import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/home_screen/ui/heading_and_subheading.dart';
import 'package:football_tracker/misc/custom_colors.dart';

void main() {

  testWidgets('Check UI of HeadingAndSubheading', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontSize: 16,
              color: CustomColors.premierLeaguePurple,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            titleSmall: TextStyle(
              fontSize: 14,
              color: CustomColors.subHeadingGrey,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        home: Row(
          children: const <Widget>[
            HeadingAndSubheading(
              heading: 'heading',
              subHeading: 'subheading',
            ),
          ],
        ),
      ),
    );

    expect(find.byType(Expanded), findsOneWidget);

    /// Check column
    final Finder columnFinder = find.byType(Column);
    final Column column = tester.firstWidget(columnFinder);
    expect(column.mainAxisAlignment, MainAxisAlignment.center);
    expect(column.children.length, 3);

    /// Check heading text
    final Finder headingFinder = find.byType(Text).first;
    final Text heading = tester.firstWidget(headingFinder);
    expect(heading.data, 'heading');
    expect(heading.style?.fontSize, 16);
    expect(heading.style?.fontWeight, FontWeight.bold);
    expect(heading.style?.overflow, TextOverflow.ellipsis);
    expect(heading.style?.color, CustomColors.premierLeaguePurple);

    expect(find.byType(SizedBox), findsOneWidget);
    
    /// Check subHeading text
    final Finder subHeadingFinder = find.byType(Text).last;
    final Text subHeading = tester.firstWidget(subHeadingFinder);
    expect(subHeading.data, 'subheading');
    expect(subHeading.style?.fontSize, 14);
    expect(subHeading.style?.fontWeight, FontWeight.bold);
    expect(subHeading.style?.overflow, TextOverflow.ellipsis);
    expect(subHeading.style?.color, CustomColors.subHeadingGrey);
  });
}