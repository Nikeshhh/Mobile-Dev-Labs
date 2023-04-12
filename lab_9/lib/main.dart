import 'package:flutter/material.dart';
import 'classes/coffee_machine.dart';
import 'classes/coffee.dart';


void main () {
  Coffee myCoffee = Coffee(
      'Эспрессо',
      50,
      0,
      100,
      0
  );
  Machine myMachine = Machine(
    500, // Количество кофе (гр)
    500, // Количество молока (мл)
    110, // Количетво воды (мл)
    500 // Количество денег (?)
  );
  myMachine.makeCoffee(myCoffee);
}