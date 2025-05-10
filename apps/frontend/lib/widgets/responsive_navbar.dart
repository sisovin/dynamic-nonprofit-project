import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../services/api_service.dart';

class ResponsiveNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppConstants.desktopBreakpoint) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppConstants.appName),
      actions: [
        NavbarItem(title: 'Home', route: '/'),
        NavbarItem(title: 'About', route: '/about'),
        NavbarItem(title: 'Causes', route: '/causes'),
        NavbarItem(title: 'Donate', route: '/donate'),
        NavbarItem(title: 'Contact', route: '/contact'),
      ],
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppConstants.appName),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(AppConstants.appName),
            ),
            DrawerItem(title: 'Home', route: '/'),
            DrawerItem(title: 'About', route: '/about'),
            DrawerItem(title: 'Causes', route: '/causes'),
            DrawerItem(title: 'Donate', route: '/donate'),
            DrawerItem(title: 'Contact', route: '/contact'),
          ],
        ),
      ),
    );
  }
}

class NavbarItem extends StatelessWidget {
  final String title;
  final String route;

  NavbarItem({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        title,
        style: AppConstants.bodyText.copyWith(color: Colors.white),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final String route;

  DrawerItem({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
