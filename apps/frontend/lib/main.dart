import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(MyApp());
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // Custom error handling logic
  };
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
