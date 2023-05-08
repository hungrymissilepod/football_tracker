import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/home_screen/ui/default_spacer.dart';
import 'package:football_tracker/home_screen/ui/loading_state.dart';
import 'package:football_tracker/misc/custom_colors.dart';

void main() {

  testWidgets('Check UI of LoadingState', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 20,
              color: CustomColors.premierLeaguePurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const LoadingState(),
      ),
    );

    expect(find.byType(DefaultSpacer), findsNWidgets(2));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    /// Check text
    final Finder textFinder = find.byType(Text).first;
    final Text text = tester.firstWidget(textFinder);
    expect(text.data, 'Fetching data...');
    expect(text.style?.fontSize, 20);
    expect(text.style?.fontWeight, FontWeight.bold);
    expect(text.style?.color, CustomColors.premierLeaguePurple);
  });
}