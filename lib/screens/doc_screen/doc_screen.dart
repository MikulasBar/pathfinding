import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:path_finding/app/router.dart';
import 'package:path_finding/app/router.gr.dart';

@RoutePage()
class DocScreen extends StatelessWidget {
  const DocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Documentation', style: TextStyle(fontSize: 18),),
            TextButton(
              child: const Text("Simulate", style: TextStyle(fontSize: 18),),
              onPressed: () {
                AutoRouter.of(context).push(const ConfigRoute());
              }
            ),
          ],
        ),
      ),
    );
  }
}