import 'package:flutter/material.dart';
import 'package:football_tracker/misc/custom_colors.dart';
import 'package:football_tracker/models/player.dart';

class SqaudListView extends StatelessWidget {
  const SqaudListView({Key? key, required this.players}) : super(key: key);

  final List<Player>? players;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: players?.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: (index % 2 == 0) ? CustomColors.playerCardDark : CustomColors.playerCardLight,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  players?[index].name ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  players?[index].position ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}