import 'package:flutter/material.dart';
import 'classes/coffee_machine.dart';
import 'classes/coffee.dart';
import 'dart:io';

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

void main () {
  runApp(MaterialApp(
    routes: {
      '/': (BuildContext context) => const MyHomePage(),
      'fillResources': (BuildContext context) => FillResourcesPage(),
    },
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

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
              onPressed: () {
              },
              child: const Text('Нет'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'fillResources');
              },
              child: const Text('Заполнить ресурсы'),
            )
          ],
        ),
      ),
    );
  }
}

class FillResourcesPage extends StatefulWidget {
  const FillResourcesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FillResourcesPageState();
}


class FillResourcesPageState extends State {

  int coffeeAmount = 0;
  int milkAmount = 0;
  int waterAmount = 0;
  int cashAmount = 0;

  @override
  Widget build(BuildContext context){
    coffeeAmount = myMachine.res
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Resources:'),
          Text('Beans: $coffeeAmount'),
          Text('Milk: $milkAmount'),
          Text('Water: $waterAmount'),
          Text('Cash: $cashAmount'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Назад'),
          )
        ],
      ),
    );
  }
}