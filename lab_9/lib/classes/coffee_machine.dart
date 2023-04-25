import 'package:flutter/rendering.dart';

import 'coffee.dart';

class Resources {
  late final int _coffeeBeans;
  late final int _milk;
  late final int _water;
  late final int _cash;

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

}

class Machine {
  late final Resources _resources;

  Machine (Resources resources) {
    setResources(resources);
  }

  void setResources(Resources resources){
    _resources = resources;
  }

  Resources getResources(){
    return _resources;
  }



  bool _isAvailableResources (Coffee coffee) {
    if (coffee.getBeansRequired() < _resources.getCoffeeBeans() &&
        coffee.getWaterRequired() < _resources.getWater() &&
        coffee.getMilkRequired() < _resources.getMilk() &&
        coffee.getCashRequired() < _resources.getCash()){
      return true;
    }
    else {
      return false;
    }
  }

  void _subtractResources (Coffee coffee) {
    _resources.setCoffeeBeans(_resources.getCoffeeBeans() - coffee.getBeansRequired());
    _resources.setWater(_resources.getWater() - coffee.getWaterRequired());
    _resources.setMilk(_resources.getMilk() - coffee.getMilkRequired());
    _resources.setCash(_resources.getCash() - coffee.getCashRequired());
  }

  String makeCoffee (Coffee coffee) {
    if (_isAvailableResources(coffee)){
      String coffeeName = coffee.getName();
      return ('Кофе готово - $coffeeName');
    }
    else{
      return ('Недостаточно ингредиентов');
    }
  }
}