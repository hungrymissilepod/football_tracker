import 'package:football_tracker/app/app.locator.dart';
import 'package:football_tracker/football_data/football_data_service.dart';
import 'package:football_tracker/models/team.dart';

class FootballDataRepo {

  final FootballDataService _footballDataService = locator<FootballDataService>();

  Team? bestTeam;

  Future<Team?> fetchBestTeam() async {
    bestTeam = await _footballDataService.fetchData();
    return bestTeam;
  }
}