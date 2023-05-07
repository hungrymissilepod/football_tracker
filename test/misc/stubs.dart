
String teamDataStub =
'''
{
  "id": 66,
  "name": "Manchester United FC",
  "crest": "https://crests.football-data.org/66.png",
  "founded": 1878,
  "venue": "Old Trafford"
}
''';

String competitionDataStub =
'''
{
  "id": 2021,
  "name": "Premier League",
  "currentSeason": {
    "id": 1490,
    "startDate": "2022-08-05",
    "endDate": "2023-05-28"
  }
}
''';

String matchDataStub =
'''
{
	"matches": [{
			"id": 0,
			"homeTeam": {
				"id": 66,
				"name": "Manchester United FC"
			},
			"awayTeam": {
				"id": 62,
				"name": "Everton FC"
			},
			"score": {
				"winner": "HOME_TEAM"
			}
		},
		{
			"id": 1,
			"homeTeam": {
				"id": 76,
				"name": "Wolverhampton Wanderers FC"
			},
			"awayTeam": {
				"id": 61,
				"name": "Chelsea FC"
			},
			"score": {
				"winner": "AWAY_TEAM"
			}
		},
		{
			"id": 2,
			"homeTeam": {
				"id": 61,
				"name": "Chelsea FC"
			},
			"awayTeam": {
				"id": 66,
				"name": "Manchester United FC"
			},
			"score": {
				"winner": "AWAY_TEAM"
			}
		}
	]
}
''';