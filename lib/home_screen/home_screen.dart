import 'package:flutter/material.dart';
import 'package:football_tracker/home_screen/home_screen_view_model.dart';
import 'package:football_tracker/home_screen/ui/banner_image.dart';
import 'package:football_tracker/home_screen/ui/best_team_view.dart';
import 'package:football_tracker/home_screen/ui/error_state.dart';
import 'package:football_tracker/home_screen/ui/loading_state.dart';
import 'package:football_tracker/misc/custom_colors.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeScreenViewModel(),
      onViewModelReady: (HomeScreenViewModel viewModel) => viewModel.init(),
      builder: (BuildContext context, HomeScreenViewModel viewModel, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: CustomColors.premierLeaguePurple,
            elevation: 0,
            title: const Text(
              'Best team tracker',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const BannerImage(),
                viewModel.isBusy ? const LoadingState()
                : viewModel.hasError ? const ErrorState()
                : const BestTeamView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: CustomColors.premierLeaguePurple,
            selectedItemColor: Colors.white,
            unselectedItemColor: CustomColors.subHeadingGrey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SizedBox(height: 30, child: Icon(Icons.home)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(height: 30, child: Icon(Icons.person)),
                label: 'Profle',
              ),
            ],
          ),
        );
      },
    );
  }
}