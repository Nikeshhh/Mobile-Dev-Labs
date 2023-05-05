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
  // Класс для страниц, которые отображают ресурсы кофемашины

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

  // Поля для отображения ресурсов
  Coffee currentCoffee = cappuccino;
  int coffeeAmount = 0;
  int milkAmount = 0;
  int waterAmount = 0;
  int cashAmount = 0;

  //

  int money = 0;

  MyTabBar() {
    // Конструктор по умолчанию
    _updateResourceView(myMachine);
  }

  Widget _buildRadioButtonForCoffee(BuildContext context, Coffee coffee) {
    // Функция создания варианта выбора вида кофе
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

  TextStyle _styleForText() {
    return const TextStyle(fontSize: 24);
  }

  Widget _buildCoffeeMachinePage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 5),
                    color: Colors.blueGrey),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            // Надписи со значениями ресурсов
                            Text('Beans: $coffeeAmount',
                                style: _styleForText()),
                            Text('Milk: $milkAmount', style: _styleForText()),
                            Text('Water: $waterAmount', style: _styleForText()),
                          ],
                        )
                      ],
                    ),
                    const Divider(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      height: 150,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 4),
                          color: Colors.yellow),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Coffee maker', style: _styleForText()),
                          Text('Your money: $money', style: _styleForText()),
                        ],
                      ),
                    )
                  ],
                )),
            const Divider(
              height: 10,
            ),
            // Радио кнопки для выбора кофе
            _buildRadioButtonForCoffee(context, cappuccino),
            _buildRadioButtonForCoffee(context, espresso),
            _buildRadioButtonForCoffee(context, americano),
            _buildRadioButtonForCoffee(context, latte),
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
          ],
        )
      ]),
    );
  }

  Widget _buildFillResourcesPage(BuildContext context) {
    return Container(
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
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty ||
                                    _myValidator(value) ||
                                    int.parse(value) <= 0) {
                                  return 'Ошибка ввода';
                                } else {
                                  myMachine.resources.coffeeBeans +=
                                      int.parse(value);
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'Кофе',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        height: 10,
                      ),
                      Row(
                        // Поле для ввода молока
                        children: [
                          Expanded(
                            child: TextFormField(validator: (value) {
                              if (value!.isEmpty ||
                                  _myValidator(value) ||
                                  int.parse(value) <= 0) {
                                return 'Ошибка ввода';
                              } else {
                                myMachine.resources.milk += int.parse(value);
                              }
                            },
                              decoration: const InputDecoration(
                                hintText: 'Молоко',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        height: 10,
                      ),
                      Row(
                        // Поле для ввода воды
                        children: [
                          Expanded(
                            child: TextFormField(validator: (value) {
                              if (value!.isEmpty ||
                                  _myValidator(value) ||
                                  int.parse(value) <= 0) {
                                return 'Ошибка ввода';
                              } else {
                                myMachine.resources.water += int.parse(value);
                              }
                            },
                              decoration: const InputDecoration(
                                hintText: 'Вода',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        height: 10,
                      ),
                      Row(
                        // Поле для ввода денег
                        children: [
                          Expanded(
                            child: TextFormField(validator: (value) {
                              if (value!.isEmpty ||
                                  _myValidator(value) ||
                                  int.parse(value) <= 0) {
                                return 'Ошибка ввода';
                              } else {
                                myMachine.resources.cash += int.parse(value);
                              }
                            },
                              decoration: const InputDecoration(
                                hintText: 'Наличные',
                              ),
                              keyboardType: TextInputType.number,
                            ),
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
        ));
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
        body: TabBarView(
          children: [
            _buildCoffeeMachinePage(context),
            _buildFillResourcesPage(context),
          ],
        ),
      ),
    );
  }
}
