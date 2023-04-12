import 'coffee.dart';

class Machine {
  late final int _coffeeBeans;
  late final int _milk;
  late final int _water;
  late final int _cash;

  Machine (int coffeeBeans, int milk, int water, int cash) {
    setCoffeeBeans(coffeeBeans);
    setMilk(milk);
    setWater(water);
    setCash(cash);
  }

  int getCoffeeBeans () {
    return _coffeeBeans;
}

  int getMilk () {
    return _milk;
  }

  int getWater () {
    return _water;
  }

  int getCash () {
    return _cash;
  }

  void setCoffeeBeans (int value) {
    _coffeeBeans = value;
  }

  void setMilk (int value) {
    _milk = value;
  }

  void setWater (int value) {
    _water = value;
  }

  void setCash (int value) {
    _cash = value;
  }

  bool _isAvailableResources (Coffee coffee) {
    if (coffee.getBeansRequired() < getCoffeeBeans() &&
        coffee.getWaterRequired() < getWater() &&
        coffee.getMilkRequired() < getMilk() &&
        coffee.getCashRequired() < getCash()){
      return true;
    }
    else {
      return false;
    }
  }

  void _subtractResources (Coffee coffee) {
    _coffeeBeans -= coffee.getBeansRequired();
    _milk -= coffee.getMilkRequired();
    _water -= coffee.getWaterRequired();
    _cash -= coffee.getCashRequired();
  }

  void makeCoffee (Coffee coffee) {
    if (_isAvailableResources(coffee)){
      String coffeeName = coffee.getName();
      print('Кофе готово - $coffeeName');
    }
    else{
      print('Недостаточно ингредиентов');
    }
  }
}