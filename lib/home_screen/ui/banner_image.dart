import 'package:flutter/material.dart';
import 'package:football_tracker/misc/custom_colors.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          color: CustomColors.premierLeaguePurple,
        ),
        const Image(
          image: AssetImage('assets/banner.jpeg'),
          height: 200,
        ),
      ],
    );
  }
}