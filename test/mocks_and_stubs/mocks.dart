import 'package:football_tracker/football_data/football_data_repo.dart';
import 'package:football_tracker/football_data/football_data_service.dart';
import 'package:football_tracker/services/http_service.dart';
import 'package:mocktail/mocktail.dart';

class HttpServiceMock extends Mock implements HttpService {}
class FootballDataServiceMock extends Mock implements FootballDataService {}
class FootballDataRepoMock extends Mock implements FootballDataRepo {}