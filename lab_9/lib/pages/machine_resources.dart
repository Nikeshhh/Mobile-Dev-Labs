import 'package:flutter/material.dart';
import 'package:lab_9/classes/coffee_machine.dart';
import 'package:lab_9/classes/page.dart';

class FillResourcesPage extends StatefulWidget {
  const FillResourcesPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FillResourcesPageState();
}

class FillResourcesPageState extends ViewPageState {
  final _formKey = GlobalKey<FormState>();

  void _fillResources() {
    // Функция для заполнения ресурсов кофемашины
    if (_formKey.currentState!.validate()) {
      setState(() {
        updateResourceView(myMachine);
      });
    }
  }

  TextStyle _styleForText() {
    return const TextStyle(fontSize: 24);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              // Колонка с виджетами
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 5),
                        color: Colors.blueGrey),
                    child: Column(
                      children: [
                        Text('Resources:', style: _styleForText()),
                        // Надписи со значениями ресурсов
                        Text('Beans: $coffeeAmount', style: _styleForText()),
                        Text('Milk: $milkAmount', style: _styleForText()),
                        Text('Water: $waterAmount', style: _styleForText()),
                        Text('Cash: $cashAmount', style: _styleForText()),
                      ],
                    )),
                const Divider(
                  height: 20,
                ),
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
                                    myValidator(value) ||
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
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty ||
                                    myValidator(value) ||
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
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty ||
                                    myValidator(value) ||
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
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty ||
                                    myValidator(value) ||
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
                  child: const Text('Добавить'),
                ),
              ],
            ),
          ],
        ));
  }
}
