import 'package:flutter/material.dart';

class HeadingAndSubheading extends StatelessWidget {
  const HeadingAndSubheading({Key? key, required this.heading, required this.subHeading}) : super(key: key);

  final String heading;
  final String subHeading;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            heading,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
          Text(
            subHeading,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}