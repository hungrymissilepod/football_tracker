import 'dart:convert' show json;

import 'package:football_tracker/misc/api_urls.dart';
import 'package:football_tracker/misc/date_time_formatter.dart';
import 'package:football_tracker/misc/most_wins_calculator.dart';
import 'package:football_tracker/models/season.dart';
import 'package:football_tracker/models/team.dart';
import 'package:football_tracker/models/match.dart';
import 'package:http/http.dart' as http;
import 'package:football_tracker/app/app.locator.dart';
import 'package:football_tracker/services/http_service.dart';

class FootballDataService {

  final HttpService _httpService = locator<HttpService>();

  Future<Team?> fetchData() async {
    final DateTime endDate = await _fetchCompetitionEndDate();

    final String dateFrom = endDate.add(const Duration(days: -30)).toFormattedString();
    final String dateTo = endDate.toFormattedString();

    final int bestTeamId = await _fetchBestTeamId(dateFrom, dateTo);

    return await _fetchBestTeamData(bestTeamId);
  }

  /// Fetches the latest competition data for the Premier League.
  /// Returns a [DateTime] of either the current date or the [endDate] of the latest competition
  /// depending on if the latest competition has already finished or not.
  /// 
  /// This is so that we can fetch all match data within the last 30 days, or last 30 days of the competition.
  Future<DateTime> _fetchCompetitionEndDate() async {
    final http.Response response = await _httpService.get('${ApiUrls.baseUrl}${ApiUrls.competitionEndpoint}');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      Season currentSeason = Season.fromMap(data['currentSeason']);
      if (currentSeason.endDate.isBefore(DateTime.now())) {
        return currentSeason.endDate;
      }
      return DateTime.now();
    } else {
      throw Error();
    }
  }


  /// Fetches all competition data between [dateFrom] and [dateTo] and calculates
  /// the team with the most wins during this period.
  Future<int> _fetchBestTeamId(String dateFrom, String dateTo) async {
    final http.Response response = await _httpService.get('${ApiUrls.baseUrl}${ApiUrls.matchesEndpoint}?dateFrom=$dateFrom&dateTo=$dateTo');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<Match> matches = (data['matches'] as List).map((e) => Match.fromMap(e)).toList();
      return MostWinsCalculator().calculateTeamWithMostWins(matches);
    } else {
      throw Error();
    }
  }

  /// Fetches team data for a team with [id].
  Future<Team?> _fetchBestTeamData(int id) async {
    final http.Response response = await _httpService.get('${ApiUrls.baseUrl}${ApiUrls.teamEndpoint}/$id');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return Team.fromMap(data);
    } else {
      throw Error();
    }
  }
}