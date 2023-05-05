Future<void> heatWater() {
  // Процесс нагрева воды
  print('Начало нагрева воды');
  return Future.delayed(const Duration(seconds: 3), () => print('Конец нагрева воды'));
}

Future<void> heatCoffee() async {
  print('Начало заваривания кофе');
  return Future.delayed(const Duration(seconds: 5), () => print('Конец заваривания кофе'));
}

Future<void> mixMilk() {
  // Взбвание молока, вместе с завариванием кофе
  print('Начало взбивания молока');
  return Future.delayed(const Duration(seconds: 5), () => print('Конец взбивания молока'));
}

Future<void> mixCoffeeAndMilk() async {
  // Смешивание кофе и молока, после заваривания кофе и взбития молока
  print('Начало смешивания молока и кофе');
  return Future.delayed(const Duration(seconds: 3), () => print('Конец смешивания кофе и молока'));
}
