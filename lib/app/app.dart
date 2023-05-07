import 'package:football_tracker/football_data/football_data_repo.dart';
import 'package:football_tracker/football_data/football_data_service.dart';
import 'package:football_tracker/home_screen/home_screen.dart';
import 'package:football_tracker/services/http_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: <StackedRoute<dynamic>>[
    MaterialRoute<dynamic>(page: HomeScreen, initial: true),
  ],
  dependencies: <DependencyRegistration>[
    Singleton(classType: NavigationService),
    Singleton(classType: HttpService),
    Singleton(classType: FootballDataService),
    Singleton(classType: FootballDataRepo),
  ],
)

class AppSetup {

}