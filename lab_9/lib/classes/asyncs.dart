Future<String> makeWater() {
  return Future.delayed(const Duration(seconds: 3), () => 'Вода готова!');
}

Future<String> makeCoffee() async {
  String coffee = await makeWater();
  return Future.delayed(const Duration(seconds: 5), () => '$coffee Кофе заварен!');
}

Future<String> makeMilk() {
  return Future.delayed(const Duration(seconds: 5), () => 'Молоков взбито!');
}

Future<String> mixCoffeeAndMilk() async {
  String coffee = await makeWater();
  String milk = await makeMilk();
  return Future.delayed(const Duration(seconds: 3), () => '$coffee $milk Молоко смешано!');
}
