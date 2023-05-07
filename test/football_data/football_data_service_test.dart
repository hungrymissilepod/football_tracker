import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/app/app.locator.dart';
import 'package:football_tracker/football_data/football_data_service.dart';
import 'package:football_tracker/misc/api_urls.dart';
import 'package:football_tracker/models/team.dart';
import 'package:football_tracker/services/http_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../mocks_and_stubs/mocks.dart';
import '../mocks_and_stubs/stubs.dart';

void main() {

  group('FootballDataService: ', () {

    setUpAll(() {
      locator.registerSingleton<HttpService>(HttpServiceMock());
    });

    test('Calling fetchData() will return a Team object when all data returns correctly', () async {
      final FootballDataService service = FootballDataService();
      final HttpServiceMock httpServiceMock = locator<HttpService>() as HttpServiceMock;

      /// Mock all http calls to return stubs
      when(() => httpServiceMock.get(captureAny(that: startsWith(ApiUrls.baseUrl + ApiUrls.competitionEndpoint)))).thenAnswer((invocation) => Future<http.Response>.value(http.Response(competitionStub, 200)));
      when(() => httpServiceMock.get(captureAny(that: startsWith(ApiUrls.baseUrl + ApiUrls.matchesEndpoint)))).thenAnswer((invocation) => Future<http.Response>.value(http.Response(matchesStub, 200)));
      when(() => httpServiceMock.get(captureAny(that: startsWith(ApiUrls.baseUrl + ApiUrls.teamEndpoint)))).thenAnswer((invocation) => Future<http.Response>.value(http.Response(teamStub, 200)));

      Team? team = await service.fetchData();

      expect(team?.id, 66);
      expect(team?.name, 'Manchester United FC');
      expect(team?.crest, isNotNull);
      expect(team?.founded, 1878);
      expect(team?.venue, 'Old Trafford');
    });

    test('Calling fetchData() will return null if a http request fails', () async {
      final FootballDataService service = FootballDataService();
      final HttpServiceMock httpServiceMock = locator<HttpService>() as HttpServiceMock;

      when(() => httpServiceMock.get(any())).thenAnswer((invocation) => Future<http.Response>.value(http.Response('', 500)));

      /// Expect that calling [fetchData] will return a null [Team] object
      /// and that an [Error] will be thrown.
      expect(() async
      {
        Team? team = await service.fetchData();
        expect(team, isNull);
        
      }, throwsA(isA<Error>()));
    });
  });
}