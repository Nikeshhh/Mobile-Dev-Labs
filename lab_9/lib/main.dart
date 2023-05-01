import 'package:flutter/material.dart';
import 'classes/coffee_machine.dart';
import 'classes/coffee.dart';
import 'dart:io';

Coffee myCoffee = Coffee('Эспрессо', 50, 0, 50, 0);
Machine myMachine = Machine(Resources(
    500, // Количество кофе (гр)
    500, // Количество молока (мл)
    290, // Количеcтво воды (мл)
    500 // Количество денег (?)
    ));

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (BuildContext context) => MyHomePage(),
      'fillResources': (BuildContext context) => FillResourcesPage(),
    },
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кофемашина'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Хотите выпить кофе?'),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(myMachine.makeCoffee(myCoffee)),
                ));
              },
              child: const Text('Да'),
            ),
            ElevatedButton(
              onPressed: () {},
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
  // Страницы для заполнения ресурсов
  final _formKey = GlobalKey<FormState>();

  bool _myValidator(val) {
    // Валидатор
    try {
      double.parse(val);
      return false;
    } on Exception {
      return true;
    }
  }

  void _updateResourceView(Machine machine) {
    // Функция для отображения текущих ресурсов на виджете
    coffeeAmount = machine.resources.coffeeBeans;
    milkAmount = machine.resources.milk;
    waterAmount = machine.resources.water;
    cashAmount = machine.resources.cash;
  }

  void _fillResources() {
    // Функция для заполнения ресурсов кофемашины
    if (_formKey.currentState!.validate()) {
      setState(() {
        _updateResourceView(myMachine);
      });
    }
  }

  FillResourcesPageState() {
    // Конструктор по умолчанию
    _updateResourceView(myMachine);
  }

  // Поля для отображения ресурсов
  int coffeeAmount = 0;
  int milkAmount = 0;
  int waterAmount = 0;
  int cashAmount = 0;
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Кофемашина'),
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Column(
                  // Колонка с виджетами
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Resources:'),
                    // Надписи со значениями ресурсов
                    Text('Beans: $coffeeAmount'),
                    Text('Milk: $milkAmount'),
                    Text('Water: $waterAmount'),
                    Text('Cash: $cashAmount'),
                    //
                    Form(
                      // Виджет формы
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            // Поле для ввода кофе
                            children: [
                              Container(
                                child: const Text('Кофе:'),
                              ),
                              Expanded(
                                child: TextFormField(validator: (value) {
                                  if (value!.isEmpty ||
                                      _myValidator(value) ||
                                      int.parse(value) <= 0) {
                                    return 'Ошибка ввода';
                                  } else {
                                    myMachine.resources.coffeeBeans =
                                        int.parse(value);
                                  }
                                }),
                              )
                            ],
                          ),
                          const Divider(
                            height: 10,
                          ),
                          Row(
                            // Поле для ввода молока
                            children: [
                              Container(
                                child: const Text('Молоко:'),
                              ),
                              Expanded(
                                child: TextFormField(validator: (value) {
                                  if (value!.isEmpty ||
                                      _myValidator(value) ||
                                      int.parse(value) <= 0) {
                                    return 'Ошибка ввода';
                                  } else {
                                    myMachine.resources.milk = int.parse(value);
                                  }
                                }),
                              )
                            ],
                          ),
                          const Divider(
                            height: 10,
                          ),
                          Row(
                            // Поле для ввода воды
                            children: [
                              Container(
                                child: const Text('Вода:'),
                              ),
                              Expanded(
                                child: TextFormField(validator: (value) {
                                  if (value!.isEmpty ||
                                      _myValidator(value) ||
                                      int.parse(value) <= 0) {
                                    return 'Ошибка ввода';
                                  } else {
                                    myMachine.resources.water =
                                        int.parse(value);
                                  }
                                }),
                              )
                            ],
                          ),
                          const Divider(
                            height: 10,
                          ),
                          Row(
                            // Поле для ввода денег
                            children: [
                              Container(
                                child: const Text('Деньги:'),
                              ),
                              Expanded(
                                child: TextFormField(validator: (value) {
                                  if (value!.isEmpty ||
                                      _myValidator(value) ||
                                      int.parse(value) <= 0) {
                                    return 'Ошибка ввода';
                                  } else {
                                    myMachine.resources.cash = int.parse(value);
                                  }
                                }),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 30,
                    ),
                    ElevatedButton(
                      // Кнопка для заполнения
                      onPressed: _fillResources,
                      child: const Text('Заполнить'),
                    ),
                    ElevatedButton(
                      // Кнопка возвращения на главную страницу
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Назад'),
                    )
                  ],
                ),
              ],
            )));
  }
}
