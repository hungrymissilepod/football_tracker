import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/home_screen/ui/squad_list_view.dart';
import 'package:football_tracker/misc/custom_colors.dart';
import 'package:football_tracker/models/player.dart';

void main() {

  testWidgets('Check UI of SquadListView', (WidgetTester tester) async {
    List<Player>? players = <Player>[
      const Player(
        name: 'Bob',
        position: 'Goalkeeper',
      ),
      const Player(
        name: 'Jake',
        position: 'Striker',
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: SqaudListView(players: players),
      ),
    );

    /// Check listView UI
    final Finder listViewFinder = find.byType(ListView);
    final ListView listView = tester.firstWidget(listViewFinder);
    expect(listViewFinder, findsOneWidget);
    expect(listView.physics, const NeverScrollableScrollPhysics());
    expect(listView.shrinkWrap, true);
    expect(listView.childrenDelegate.estimatedChildCount, 2);

    /// Check first card UI
    final Finder firstCardFinder = find.byType(Card).first;
    final Card firstCard = tester.firstWidget(firstCardFinder);
    expect(firstCard.elevation, 0);
    expect(firstCard.shape, RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
    expect(firstCard.color, CustomColors.playerCardDark);

    /// Check first card text UI
    expect(find.text('Bob'), findsOneWidget);
    expect(find.text('Goalkeeper'), findsOneWidget);

    /// Check second card UI
    final Finder secondCardFinder = find.byType(Card).last;
    final Card secondCard = tester.firstWidget(secondCardFinder);
    expect(secondCard.color, CustomColors.playerCardLight);

    /// Check second card text UI
    expect(find.text('Jake'), findsOneWidget);
    expect(find.text('Striker'), findsOneWidget);
  });
}