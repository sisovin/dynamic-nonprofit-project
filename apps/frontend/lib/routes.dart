import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/causes_page.dart';
import 'pages/donate_page.dart';
import 'pages/contact_page.dart';
import 'pages/team_page.dart';
import 'pages/testimonial_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => HomePage(),
  '/about': (context) => AboutPage(),
  '/causes': (context) => CausesPage(),
  '/donate': (context) => DonatePage(),
  '/contact': (context) => ContactPage(),
  '/team': (context) => TeamPage(),
  '/testimonials': (context) => TestimonialPage(),
};
