import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
  static const maxSize = 20.0;
  
  late int width;
  late int height;

  @override
  void initState() {
    super.initState();
    width = minSize.toInt();
    height = minSize.toInt();
  }

  void changeWidth(double value) {
    setState(() {
      width = value.toInt();
    });
  }

  void changeHeight(double value) {
    setState(() {
      height = value.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Choose config', style: TextStyle(fontSize: 28)),
              const SizedBox(height: 30),
              Text('Width: $width', style: const TextStyle(fontSize: 18),),
              SizeSlider(value: width.toDouble(), onChanged: changeWidth, minSize: minSize, maxSize: maxSize),
              Text('Height: $height', style: const TextStyle(fontSize: 18),),
              SizeSlider(value: height.toDouble(), onChanged: changeHeight, minSize: minSize, maxSize: maxSize),
              const SizedBox(height: 30),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => context.router.push(PositionConfigRoute(width: width, height: height)),
        child: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
