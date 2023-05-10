import 'package:flutter/material.dart';
import 'package:lab_9/coffee_types.dart';
import 'package:lab_9/classes/coffee_machine.dart';
import 'package:lab_9/classes/coffee.dart';
import 'package:lab_9/classes/page.dart';

class CoffeeMachinePage extends StatefulWidget {
  const CoffeeMachinePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CoffeeMachinePageState();
}

class CoffeeMachinePageState extends ViewPageState {
  // Страница кофемашины
  final _moneyFormKey = GlobalKey<FormState>();

  Coffee currentCoffee = cappuccino;

  void _addMoney() {
    // Метод добавления денег
    if (_moneyFormKey.currentState!.validate()) {
      setState(() {});
    }
  }

  Widget _buildRadioButtonForCoffee(BuildContext context, Coffee coffee) {
    // Функция создания варианта выбора вида кофе
    String name = coffee.name;
    int cost = coffee.cashRequired;
    return ListTile(
      title: Text('$name ($cost р.)'),
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
                                style: styleForText()),
                            Text('Milk: $milkAmount', style: styleForText()),
                            Text('Water: $waterAmount', style: styleForText()),
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
                          Text('Coffee maker', style: styleForText()),
                          Text('Your money: $money', style: styleForText()),
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
              onPressed: () async {
                String answer = await myMachine.makeCoffee(currentCoffee);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(answer),
                  duration: const Duration(seconds: 1),
                ));
                setState(() {
                  updateResourceView(myMachine);
                });
              },
              child: const Text('Сделать кофе'),
            ),
          ],
        ),
        Form(
          key: _moneyFormKey,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty ||
                        myValidator(value) ||
                        int.parse(value) <= 0) {
                      return 'Ошибка ввода';
                    } else {
                      money += int.parse(value);
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Наличные',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                onPressed: _addMoney,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
