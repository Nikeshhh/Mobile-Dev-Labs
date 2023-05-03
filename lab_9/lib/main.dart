import 'package:flutter/material.dart';
import 'package:lab_9/classes/coffee_types.dart';
import 'classes/coffee_machine.dart';
import 'classes/coffee.dart';
import 'classes/enums.dart';
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
      'mainPage': (BuildContext context) => CoffeeMachinePage(),
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
              onPressed: () => Navigator.pushNamed(context, 'mainPage'),
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

class CoffeeMachineViewState extends State {
  // Класс для страниц, которые отображают ресурсы кофемашины

  // Поля для отображения ресурсов
  int coffeeAmount = 0;
  int milkAmount = 0;
  int waterAmount = 0;
  int cashAmount = 0;

  //

  CoffeeMachineViewState() {
    // Конструктор по умолчанию
    _updateResourceView(myMachine);
  }

  void _updateResourceView(Machine machine) {
    // Функция для отображения текущих ресурсов на виджете
    coffeeAmount = machine.resources.coffeeBeans;
    milkAmount = machine.resources.milk;
    waterAmount = machine.resources.water;
    cashAmount = machine.resources.cash;
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class FillResourcesPageState extends CoffeeMachineViewState {
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

  void _fillResources() {
    // Функция для заполнения ресурсов кофемашины
    if (_formKey.currentState!.validate()) {
      setState(() {
        _updateResourceView(myMachine);
      });
    }
  }

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
                                    myMachine.resources.coffeeBeans +=
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
                                    myMachine.resources.milk += int.parse(value);
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
                                    myMachine.resources.water +=
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
                                    myMachine.resources.cash += int.parse(value);
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

class CoffeeMachinePage extends StatefulWidget {
  const CoffeeMachinePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CoffeeMachinePageState();
}

class CoffeeMachinePageState extends CoffeeMachineViewState {
  // Основная страница с кофемашиной
  final _formKey = GlobalKey<FormState>();

  Coffee currentCoffee = cappuccino;

  Widget buildButtonForCoffee(BuildContext context, CoffeeTypes coffeeType) {
    // Функция создания кнопки для приготовления определенного вида кофе
    Coffee coffee = getCoffeeType(coffeeType);
    String name = coffee.name;
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(myMachine.makeCoffee(coffee)),
        ));
        setState(() {
          _updateResourceView(myMachine);
        });
      },
      child: Text(name),
    );
  }

  Widget buildRadioButtonForCoffee(BuildContext context, Coffee coffee){
    String name = coffee.name;
    return ListTile(
      title: Text(name),
      leading: Radio<Coffee>(
        value: coffee,
        groupValue: currentCoffee,
        onChanged: (Coffee? value) {
          setState(() {
            currentCoffee = value!;
          });
        },
      ),
    );
  }

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Resources:'),
                  // Надписи со значениями ресурсов
                  Text('Beans: $coffeeAmount'),
                  Text('Milk: $milkAmount'),
                  Text('Water: $waterAmount'),
                  Text('Cash: $cashAmount'),
                  // Радио кнопки для выбора кофе
                  buildRadioButtonForCoffee(context, cappuccino),
                  buildRadioButtonForCoffee(context, espresso),
                  buildRadioButtonForCoffee(context, americano),
                  buildRadioButtonForCoffee(context, latte),
                  //
                  // Кнопка приготовления кофе
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(myMachine.makeCoffee(currentCoffee)),
                      ));
                      setState(() {
                        _updateResourceView(myMachine);
                      });
                    },
                    child: const Text('Сделать кофе'),
                  ),
                  //
                ],
              )
            ]
          ),
        ));
  }
}
