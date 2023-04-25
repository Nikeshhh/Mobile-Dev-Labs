import 'package:flutter/material.dart';
import 'classes/coffee_machine.dart';
import 'classes/coffee.dart';
import 'dart:io';


void main () {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Coffee myCoffee = Coffee(
        'Эспрессо',
        50,
        0,
        50,
        0
    );
    Machine myMachine = Machine(
        Resources(
            500, // Количество кофе (гр)
            500, // Количество молока (мл)
            290, // Количеcтво воды (мл)
            500 // Количество денег (?)
        )
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Кофемашина'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Хотите выпить кофе?'),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(myMachine.makeCoffee(myCoffee)),
                  )
                );
              },
              child: const Text('Да'),
            ),
            ElevatedButton(
              onPressed: () { // TODO: приложение должно выключаться
              },
              child: const Text('Нет'),
            ),
          ],
        ),
      ),
    );
  }
}