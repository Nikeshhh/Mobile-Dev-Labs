import 'package:lab_9/classes/abstracts.dart';

class Coffee extends ICoffee {
  late final String _name;
  late final int _beansRequired;
  late final int _milkRequired;
  late final int _waterRequired;
  late final int _cashRequired;

  Coffee (String name, int beansRequired, int milkRequired, int waterRequired, int cashRequired) {
    setName(name);
    setBeansRequired(beansRequired);
    setMilkRequired(milkRequired);
    setWaterRequired(waterRequired);
    setCashRequired(cashRequired);
  }

  String getName () {
    return _name;
  }

  @override
  int getBeansRequired () {
    return _beansRequired;
  }

  @override
  int getMilkRequired () {
    return _milkRequired;
  }

  @override
  int getWaterRequired () {
    return _waterRequired;
  }

  @override
  int getCashRequired () {
    return _cashRequired;
  }

  void setName (String value) {
    _name = value;
  }

  void setBeansRequired (int value) {
    _beansRequired = value;
  }

  void setMilkRequired (int value) {
    _milkRequired = value;
  }

  void setWaterRequired (int value) {
    _waterRequired = value;
  }

  void setCashRequired (int value) {
    _cashRequired = value;
  }

}