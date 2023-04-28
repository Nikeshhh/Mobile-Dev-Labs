import 'package:lab_9/classes/abstracts.dart';

class Coffee extends ICoffee {
  String _name = '';
  int _beansRequired = 0;
  int _milkRequired = 0;
  int _waterRequired = 0;
  int _cashRequired = 0;

  Coffee (String name, int beansRequired, int milkRequired, int waterRequired, int cashRequired) {
    this.name = name;
    this.beansRequired = beansRequired;
    this.milkRequired = milkRequired;
    this.waterRequired = waterRequired;
    this.cashRequired = cashRequired;
  }

  String get name {
    return _name;
  }

  @override
  int get beansRequired {
    return _beansRequired;
  }

  @override
  int get milkRequired {
    return _milkRequired;
  }

  @override
  int get waterRequired {
    return _waterRequired;
  }

  @override
  int get cashRequired {
    return _cashRequired;
  }

  set name (String value) {
    _name = value;
  }

  set beansRequired (int value) {
    _beansRequired = value;
  }

  set milkRequired (int value) {
    _milkRequired = value;
  }

  set waterRequired (int value) {
    _waterRequired = value;
  }

  set cashRequired (int value) {
    _cashRequired = value;
  }

}