import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/app/app.locator.dart';
import 'package:football_tracker/football_data/football_data_repo.dart';
import 'package:football_tracker/football_data/football_data_service.dart';
import 'package:football_tracker/models/team.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks_and_stubs/mocks.dart';

void main() {

  group('FootballDataRepo: ', () {

    setUpAll(() {
      locator.registerSingleton<FootballDataService>(FootballDataServiceMock());
    });
    
    test('Trying to access bestTeam before it is initialised will throw a LateInitializationError', () async {
      final FootballDataRepo repo = FootballDataRepo();
      expect(() => repo.bestTeam, throwsA(isA<Error>()));
    });

    test('Calling fetchBestTeam returns a Team object', () async {
      final FootballDataRepo repo = FootballDataRepo();
      final FootballDataServiceMock footballDataServiceMock = locator<FootballDataService>() as FootballDataServiceMock;

      when(() => footballDataServiceMock.fetchData()).thenAnswer((invocation) => Future<Team?>.value(Team(id: 66, name: 'Manchester United FC')));

      await repo.fetchBestTeam();

      expect(repo.bestTeam?.id, 66);
      expect(repo.bestTeam?.name, 'Manchester United FC');
      expect(repo.bestTeam?.crest, isNull);
    });

    test('Calling fetchBestTeam can return null', () async {
      final FootballDataRepo repo = FootballDataRepo();
      final FootballDataServiceMock footballDataServiceMock = locator<FootballDataService>() as FootballDataServiceMock;

      when(() => footballDataServiceMock.fetchData()).thenAnswer((invocation) => Future<Team?>.value(null));

      await repo.fetchBestTeam();

      expect(repo.bestTeam, isNull);
    });
  });
}