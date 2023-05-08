import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/app/app.locator.dart';
import 'package:football_tracker/football_data/football_data_repo.dart';
import 'package:football_tracker/home_screen/home_screen_view_model.dart';
import 'package:football_tracker/home_screen/ui/default_spacer.dart';
import 'package:football_tracker/home_screen/ui/error_state.dart';
import 'package:football_tracker/misc/custom_colors.dart';
import 'package:football_tracker/models/team.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stacked/stacked.dart';

import '../../mocks_and_stubs/mocks.dart';

void main() {

  setUpAll(() {
    locator.registerSingleton<FootballDataRepo>(FootballDataRepoMock());
  });

  testWidgets('Check UI of ErrorState', (WidgetTester tester) async {
    /// Mock the repo to return a [Team] object
    final FootballDataRepoMock footballDataRepoMock = locator<FootballDataRepo>() as FootballDataRepoMock;
    when(() => footballDataRepoMock.fetchBestTeam()).thenAnswer((invocation) => Future<Team?>.value(Team(id: 66, name: 'Manchester United FC')));
    
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
        home: ViewModelBuilder.reactive(
          viewModelBuilder: () => HomeScreenViewModel(),
          builder: (BuildContext context, HomeScreenViewModel viewModel, Widget? child) {
            return const ErrorState();
          },
        ),
      ),
    );

    expect(find.byType(DefaultSpacer), findsNWidgets(2));
    expect(find.text('Failed to load data'), findsOneWidget);

    /// Tap the 'Retry' button
    await tester.tap(find.byType(TextButton));
    /// Verify that the [fetchBestTeam] method in the repo was called
    verify(() => footballDataRepoMock.fetchBestTeam()).called(1);
  });
}