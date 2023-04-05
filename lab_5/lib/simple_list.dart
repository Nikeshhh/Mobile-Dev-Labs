import 'package:flutter/material.dart';

class MySimpleList extends StatelessWidget {
  const MySimpleList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Простой список',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Список элементов'),
        ),
        body: ListView(
          children: const [
            Text('0000'),
            Divider(),
            Text('0001'),
            Divider(),
            Text('0010')
          ],
        ),
      ),
    );
  }
}