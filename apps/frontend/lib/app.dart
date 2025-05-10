import 'package:flutter/material.dart';
import 'constants/app_constants.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        primaryColor: AppConstants.primaryColor,
        accentColor: AppConstants.accentColor,
        backgroundColor: AppConstants.backgroundColor,
        textTheme: TextTheme(
          headline1: AppConstants.heading1,
          headline2: AppConstants.heading2,
          bodyText1: AppConstants.bodyText,
        ),
      ),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
