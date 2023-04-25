import 'coffee.dart';
import 'coffee_types.dart';

enum CoffeeTypes {
  espresso,
  americano,
  cappuccino,
  latte
}

Coffee getCoffeType(CoffeeTypes type){
  switch(type){
    case CoffeeTypes.espresso: return espresso;
    case CoffeeTypes.americano: return americano;
    case CoffeeTypes.cappuccino: return cappuccino;
    case CoffeeTypes.latte: return latte;
  }
}