abstract class ICoffee {
  // Интерфейс для класса кофе
  String get name;
  int get beansRequired;
  int get milkRequired;
  int get waterRequired;
  int get cashRequired;
  set name(String value);
  set beansRequired(int value);
  set milkRequired(int value);
  set waterRequired(int value);
  set cashRequired(int value);
}