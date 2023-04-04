import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => const MainScreen(),
      '/second': (BuildContext context) => const SecondScreen(),
    },
  ));
}

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Возвращение значения'),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/second'); // Переход на следующее окно
          },
          child: const Text('Приступить к выбору'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Выберите любой вариант'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Выравнивание кнопок по центру
          children: [
            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar( // Вывод ответа
                    const SnackBar(
                        content: Text('Да!'),
                        duration: Duration(seconds: 2),
                    ),
                );
                Navigator.pop(context); // Возвращение на предыдущее окно
              },
              child: const Text('Да'),
            ),
            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar( // Вывод ответа
                  const SnackBar(
                    content: Text('Нет!'),
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.pop(context); // Возвращение на предыдущее окно
              },
              child: const Text('Нет'),
            ),
          ],
        ),
      ),
    );
  }
}
