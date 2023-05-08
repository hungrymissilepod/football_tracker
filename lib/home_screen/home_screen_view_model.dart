import 'package:football_tracker/app/app.locator.dart';
import 'package:football_tracker/football_data/football_data_repo.dart';
import 'package:football_tracker/models/team.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  
  final FootballDataRepo _footballDataRepo = locator<FootballDataRepo>();

  Team? bestTeam;

  Future<void> init() async {
    bestTeam = await runBusyFuture(_footballDataRepo.fetchBestTeam());
  }
}