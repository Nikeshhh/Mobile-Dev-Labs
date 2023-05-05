import 'package:flutter/material.dart';
import 'package:lab_9/classes/coffee_machine.dart';

class ViewPageState extends State {
  // Общий класс для страницы, предоставляющий поля и методы для отображения

  // Поля для отображения ресурсов
  int coffeeAmount = 0;
  int milkAmount = 0;
  int waterAmount = 0;
  int cashAmount = 0;

  ViewPageState() {
    // Конструктор по умолчанию
    updateResourceView(myMachine);
  }

  bool myValidator(val) {
    // Валидатор
    try {
      double.parse(val);
      return false;
    } on Exception {
      return true;
    }
  }

  TextStyle styleForText() {
    return const TextStyle(fontSize: 24);
  }

  void updateResourceView(Machine machine) {
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
