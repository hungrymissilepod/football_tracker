import 'package:flutter/material.dart';
import 'package:football_tracker/app/app.locator.dart';
import 'package:football_tracker/app/app.router.dart';
import 'package:football_tracker/home_screen/home_screen.dart';
import 'package:football_tracker/misc/custom_colors.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            color: CustomColors.premierLeaguePurple,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            color: CustomColors.premierLeaguePurple,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            color: CustomColors.subHeadingGrey,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      home: const HomeScreen(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}