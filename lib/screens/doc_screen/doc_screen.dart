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
      body: const Center(
        child: Text('Documentation soon :)', style: TextStyle(fontSize: 18),),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () => context.router.push(const ConfigRoute())
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}