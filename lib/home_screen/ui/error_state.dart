import 'package:flutter/material.dart';
import 'package:football_tracker/home_screen/home_screen_view_model.dart';
import 'package:football_tracker/home_screen/ui/default_spacer.dart';
import 'package:football_tracker/misc/custom_colors.dart';
import 'package:stacked/stacked.dart';

class ErrorState extends ViewModelWidget<HomeScreenViewModel> {
  const ErrorState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeScreenViewModel viewModel) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: size.height,
        minWidth: size.width,
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const DefaultSpacer(),
            Text(
              'Failed to load data',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const DefaultSpacer(),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                backgroundColor: MaterialStateProperty.all(CustomColors.premierLeaguePurple),
              ),
              onPressed: () => viewModel.init(),
              child: Text(
                'Retry',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}