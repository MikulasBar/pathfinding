import 'package:flutter/material.dart';
import 'app/router.dart' as routing;
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = routing.Router();

    return MaterialApp.router(
      routerConfig: router.config(),
    );
  }
}
