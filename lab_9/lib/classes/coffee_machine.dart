import 'coffee.dart';

class Resources {
  int _coffeeBeans = 0;
  int _milk = 0;
  int _water = 0;
  int _cash = 0;

  Resources (int coffee, int milk, int water, int cash){
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

  set coffeeBeans (int value) {
    _coffeeBeans = value;
  }

  set milk (int value) {
    _milk = value;
  }

  set water (int value) {
    _water = value;
  }

  set cash (int value) {
    _cash = value;
  }

}

class Machine {
  late final Resources _resources;

  Machine (Resources resources) {
    resources = resources;
  }

  set resources(Resources resources){
    _resources = resources;
  }

  Resources getResources(){
    return _resources;
  }



  bool _isAvailableResources (Coffee coffee) {
    if (coffee.beansRequired < _resources.coffeeBeans &&
        coffee.waterRequired < _resources.water &&
        coffee.milkRequired < _resources.milk &&
        coffee.cashRequired < _resources.cash) {
      return true;
    }
    else {
      return false;
    }
  }

  void _subtractResources (Coffee coffee) {
    _resources.coffeeBeans = (_resources.coffeeBeans - coffee.beansRequired);
    _resources.water = (_resources.water - coffee.waterRequired);
    _resources.milk = (_resources.milk - coffee.milkRequired);
    _resources.cash = (_resources.cash - coffee.cashRequired);
  }

  String makeCoffee (Coffee coffee) {
    if (_isAvailableResources(coffee)){
      String coffeeName = coffee.name;
      _subtractResources(coffee);
      return ('Кофе готово - $coffeeName');
    }
    else{
      return ('Недостаточно ингредиентов');
    }
  }
}