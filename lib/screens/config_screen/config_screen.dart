import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:path_finding/algorithm.dart';
import 'package:path_finding/app/router.dart';
import 'package:path_finding/app/router.gr.dart';
import 'package:path_finding/screens/config_screen/widgets/size_slider.dart';

@RoutePage()
class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  static const minSize = 2.0;
  static const maxSize = 10.0;
  
  late int rows;
  late int columns;
  late Algorithm pickedAlg;

  @override
  void initState() {
    super.initState();
    rows = minSize.toInt();
    columns = minSize.toInt();
  }

  void changeRows(double value) {
    setState(() {
      rows = value.toInt();
    });
  }

  void changeColumns(double value) {
    setState(() {
      columns = value.toInt();
    });
  }

  void changeAlg(Algorithm? value) {
    if (value == null) {
      print('Algorithm is null');
      return;
    }

    setState(() {
      pickedAlg = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Choose config', style: TextStyle(fontSize: 28)),
              const SizedBox(height: 30),
              Text('Rows: $rows', style: const TextStyle(fontSize: 18),),
              SizeSlider(value: rows.toDouble(), onChanged: changeRows, minSize: minSize, maxSize: maxSize),
              Text('Columns: $columns', style: const TextStyle(fontSize: 18),),
              SizeSlider(value: columns.toDouble(), onChanged: changeColumns, minSize: minSize, maxSize: maxSize),
              const SizedBox(height: 30),
              const Text('Algorithm', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              DropdownMenu<Algorithm>(
                dropdownMenuEntries: Algorithm.variants.map(
                    (e) => DropdownMenuEntry(value: e, label: e.toString())
                  ).toList(),
                onSelected: changeAlg,
                initialSelection: Algorithm.BFS,
              ),
              const SizedBox(height: 30),
              FloatingActionButton(
                onPressed: () {
                  AutoRouter.of(context)
                    .push(const PositionConfigRoute());
                },
                child: const Icon(Icons.arrow_right_alt),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
