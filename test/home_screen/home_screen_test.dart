import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/app/app.locator.dart';
import 'package:football_tracker/football_data/football_data_repo.dart';
import 'package:football_tracker/home_screen/home_screen.dart';
import 'package:football_tracker/home_screen/ui/loading_state.dart';
import 'package:football_tracker/misc/custom_colors.dart';
import 'package:football_tracker/models/team.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks_and_stubs/mocks.dart';

void main() {

  setUpAll(() {
    locator.registerSingleton<FootballDataRepo>(FootballDataRepoMock());
  });

  testWidgets('Check UI of HomeScreen', (WidgetTester tester) async {
    /// Mock the repo to return a [Team] object
    final FootballDataRepoMock footballDataRepoMock = locator<FootballDataRepo>() as FootballDataRepoMock;
    when(() => footballDataRepoMock.fetchBestTeam()).thenAnswer((invocation) => Future<Team?>.value(Team(id: 66, name: 'Manchester United FC')));
    
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );

    final Scaffold scaffold = tester.firstWidget(find.byType(Scaffold).first);
    expect(scaffold.backgroundColor, Colors.white);

    final AppBar appBar = tester.firstWidget(find.byType(AppBar).first);
    expect(appBar.backgroundColor, CustomColors.premierLeaguePurple);
    expect(appBar.elevation, 0);
    
    final Text appBarText = appBar.title as Text;
    expect(appBarText.data, 'Best team tracker');
    expect(appBarText.style?.fontWeight, FontWeight.bold);

    expect(find.byType(Image), findsOneWidget);

    final BottomNavigationBar bottomNavigationBar = tester.firstWidget(find.byType(BottomNavigationBar));
    expect(bottomNavigationBar.backgroundColor, CustomColors.premierLeaguePurple);
    expect(bottomNavigationBar.items.length, 2);
  });

  testWidgets('LoadingState is shown when HomeScreen is first displayed', (WidgetTester tester) async {
    /// Mock the repo to return a [Team] object
    final FootballDataRepoMock footballDataRepoMock = locator<FootballDataRepo>() as FootballDataRepoMock;
    when(() => footballDataRepoMock.fetchBestTeam()).thenAnswer((invocation) => Future<Team?>.value(Team(id: 66, name: 'Manchester United FC')));
    
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );

    expect(find.byType(LoadingState), findsOneWidget);
  });
}