import 'package:flutter/material.dart';

class MyInfinityList extends StatelessWidget {
  const MyInfinityList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Бесконечный список',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Список элементов'),
        ),
        body: ListView.builder( // Виджет для бесконечного построения
          itemBuilder: (context, index) {
            return Text('строка $index');
          },
        ),
      ),
    );
  }
}