import 'package:flutter/material.dart';
import 'classes/coffee_machine.dart';
import 'classes/coffee.dart';


void main () {
  Coffee myCoffee = Coffee();
  myCoffee.setName('Эспрессо');
  myCoffee.setBeansRequired(50);
  myCoffee.setMilkRequired(0);
  myCoffee.setWaterRequired(100);
  myCoffee.setCashRequired(0);
  Machine myMachine = Machine(
    500, // Количество кофе (гр)
    500, // Количество молока (мл)
    50, // Количетво воды (мл)
    500 // Количество денег (?)
  );
  myMachine.makeCoffee(myCoffee);
}