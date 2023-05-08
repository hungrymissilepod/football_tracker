import 'package:flutter/material.dart';
import 'package:football_tracker/home_screen/ui/default_spacer.dart';
import 'package:football_tracker/misc/custom_colors.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const DefaultSpacer(),
            const CircularProgressIndicator(
              color: CustomColors.premierLeaguePurple,
            ),
            const DefaultSpacer(),
            Text(
              'Fetching data...',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}