import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/nonprofit_list_screen.dart';
import 'screens/nonprofit_detail_screen.dart';
import 'screens/project_list_screen.dart';
import 'screens/project_detail_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => HomeScreen(),
  '/nonprofits': (context) => NonprofitListScreen(),
  '/nonprofits/:id': (context) => NonprofitDetailScreen(),
  '/projects': (context) => ProjectListScreen(),
  '/projects/:id': (context) => ProjectDetailScreen(),
};
