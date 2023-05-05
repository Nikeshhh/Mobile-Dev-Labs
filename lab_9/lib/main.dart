import 'package:flutter/material.dart';
import 'package:lab_9/pages/machine_resources.dart';
import 'package:lab_9/pages/coffee_maker.dart';

void main() {
  runApp(MaterialApp(
    home: const TabBarWidget(),
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
  ));
}

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyTabBar();
}

class MyTabBar extends State {
  // Главная страница

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.coffee_maker)),
              Tab(icon: Icon(Icons.refresh)),
            ],
          ),
          title: const Text('Coffee'),
        ),
        body: const TabBarView(
          children: [
            CoffeeMachinePage(),
            FillResourcesPage(),
          ],
        ),
      ),
    );
  }
}
