import 'package:flutter/material.dart';
import 'package:football_tracker/home_screen/home_screen_view_model.dart';
import 'package:football_tracker/home_screen/ui/default_spacer.dart';
import 'package:football_tracker/home_screen/ui/heading_and_subheading.dart';
import 'package:football_tracker/home_screen/ui/squad_list_view.dart';
import 'package:football_tracker/misc/custom_colors.dart';
import 'package:stacked/stacked.dart';

class BestTeamView extends ViewModelWidget<HomeScreenViewModel> {
  const BestTeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeScreenViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image(
            image: NetworkImage(viewModel.bestTeam?.crest ?? ''),
            height: 140,
          ),
          const DefaultSpacer(),
          Text(
            '${viewModel.bestTeam?.name}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const DefaultSpacer(),
          Text(
            'Games won in last 30 days:',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          Text(
            '${viewModel.bestTeam?.gamesWon}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const DefaultSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              HeadingAndSubheading(
                heading: 'Founded:',
                subHeading: '${viewModel.bestTeam?.founded}'
              ),
              HeadingAndSubheading(
                heading: 'Stadium:',
                subHeading: '${viewModel.bestTeam?.venue}'
              ),
              HeadingAndSubheading(
                heading: 'Coach:',
                subHeading: '${viewModel.bestTeam?.coach?.name}'
              ),
            ],
          ),
          const DefaultSpacer(),
          const Divider(
            color: CustomColors.premierLeaguePurple,
            thickness: 0.5,
          ),
          const DefaultSpacer(),
          Text(
            'Squad:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const DefaultSpacer(),
          SqaudListView(players: viewModel.bestTeam?.players),
        ],
      ),
    );
  }
}