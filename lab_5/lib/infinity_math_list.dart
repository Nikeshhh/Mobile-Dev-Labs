import 'package:flutter/material.dart';
import 'dart:math';

class MyInfinityMathList extends StatelessWidget {
  const MyInfinityMathList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Бесконечный список со степенью',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Список элементов'),
        ),
        body: ListView.builder( // Виджет для бесконечного построения
          itemBuilder: (context, index) {
            var power = pow(2, index); // Степень двойки
            return Column( // Колонка с текстом и разделителем
              crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание надписи с начала строки
              children: [
                Text( // Текст
                  '2 ^ $index = $power',
                  style: const TextStyle(fontSize: 30,),
                ),
                const Divider(height: 40,), // Разделитель
              ],
            );
          },
        ),
      ),
    );
  }
}