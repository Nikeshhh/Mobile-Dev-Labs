import 'coffee.dart';
import 'async.dart';

int money = 1000; // Деньги пользователя

class Resources {
  // Класс ресурсов кофемашины

  int _coffeeBeans = 0;
  int _milk = 0;
  int _water = 0;
  int _cash = 0;

  Resources(int coffee, int milk, int water, int cash) {
    this.coffeeBeans = coffee;
    this.milk = milk;
    this.water = water;
    this.cash = cash;
  }

  int get coffeeBeans {
    return _coffeeBeans;
  }

  int get milk {
    return _milk;
  }

  int get water {
    return _water;
  }

  int get cash {
    return _cash;
  }

  set coffeeBeans(int value) {
    _coffeeBeans = value;
  }

  set milk(int value) {
    _milk = value;
  }

  set water(int value) {
    _water = value;
  }

  set cash(int value) {
    _cash = value;
  }
}

class Machine {
  // Класс кофемашины
  Resources _resources = Resources(0, 0, 0, 0);

  Machine(Resources resources) {
    _resources = resources;
  }

  set resources(Resources resources) {
    _resources = resources;
  }

  Resources get resources {
    return _resources;
  }

  bool _isAvailableResources(Coffee coffee) {
    // Функция проверки на доступность ресурсов
    if (coffee.beansRequired < _resources.coffeeBeans &&
        coffee.waterRequired < _resources.water &&
        coffee.milkRequired < _resources.milk &&
        coffee.cashRequired < money) {
      return true;
    } else {
      return false;
    }
  }

  void _subtractResources(Coffee coffee) {
    // Функция уменьшения ресурсов
    _resources.coffeeBeans -= coffee.beansRequired;
    _resources.water -= coffee.waterRequired;
    _resources.milk -= coffee.milkRequired;
    _resources.cash += coffee.cashRequired;
    money -= coffee.cashRequired;
  }

  Future<String> makeCoffee(Coffee coffee) async {
    // Процесс приготовления кофе
    if (_isAvailableResources(coffee)) {
      String coffeeName = coffee.name;
      await heatWater(); // Нагрев воды
      if (coffee.milkRequired > 0) {
        await Future.wait(
            [heatCoffee(), mixMilk()]); // Заваривание кофе и взбивание молока
        await mixCoffeeAndMilk(); // Смешивание кофе и молока
      } else {
        await heatCoffee(); // Заваривание кофе
      }
      _subtractResources(coffee);
      return ('Кофе готово - $coffeeName');
    } else {
      return ('Недостаточно ингредиентов');
    }
  }
}

Machine myMachine = Machine(Resources(
    // Экземпляр кофемашины
    500, // Количество кофе (гр)
    500, // Количество молока (мл)
    290, // Количеcтво воды (мл)
    500 // Количество денег (?)
    ));
