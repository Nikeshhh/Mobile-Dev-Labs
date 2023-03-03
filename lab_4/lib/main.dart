import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Общежития КУБГАУ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView( // Виджет с прокруткой
          children: [
            Container( // Виджет для изображения

            ),
            Row( // Строка с основной информацией
              children: [
                const ListTile( // Лист тайл с названием общаги и адресом
                  title: , // Название
                  subtitle: , // Адрес

                ),
                ElevatedButton(
                  onPressed: , // Функция нажатия на кнопку
                  child: const Icon( // Иконка сердечка
                    Icons.heart_broken
                  ),
                ),
                Text( // Количество лайков
                  'asdf'
                )
              ],
            ),
            Row( // Строка с кнопками

            )
          ],
      ),
    );
  }
}
