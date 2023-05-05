Future<String> heatWaterProcess() {
  // Процесс нагрева воды
  return Future.delayed(const Duration(seconds: 3), () => 'Вода готова!');
}

Future<void> heatWater() async {
  // Нагрев воды
  print('Начало нагрева воды');
  await heatWaterProcess();
  print('Конец нагрева воды');
}

Future<String> heatCoffeeProcess() async {
  return Future.delayed(const Duration(seconds: 5), () => 'Кофе заварен!');
}

Future<void> heatCoffee() async {
  // Заваривание кофе, после нагрева воды
  await heatWater();
  print('Начало заваривания кофе');
  await heatCoffeeProcess();
  print('Конец заваривания кофе');
}

Future<String> mixMilkProcess() {
  return Future.delayed(const Duration(seconds: 5), () => 'Молоков взбито!');
}

Future<void> mixMilk() async {
  // Взбвание молока, вместе с завариванием кофе
  print('Начало взбивания молока');
  heatCoffee();
  await mixMilkProcess();
  print('Конец взбивания молока');
}

Future<String> mixCoffeeAndMilkProcess() {
  return Future.delayed(const Duration(seconds: 3), () => 'Молоко смешано!');
}

Future<void> mixCoffeeAndMilk() async {
  // Смешивание кофе и молока, после заваривания кофе и взбития молока
  await mixMilk();
  print('Начало смешивания кофе и молока');
  await mixCoffeeAndMilkProcess();
  print('Конец смешивания кофе и молока');
}
