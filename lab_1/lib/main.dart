import 'package:flutter/material.dart';

void main() { // Точка входа
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // Класс основого родительского виджета
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Основной родительский виджет
      title: 'My first application',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Инкремент'), // Вложенный виджет 1-го уровня
    );
  }
}

class MyHomePage extends StatefulWidget { // Класс виджета 1-го уровня
  const MyHomePage({super.key, required this.title});

  final String title; // Заголовок страницы

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Создание страницы
}

class _MyHomePageState extends State<MyHomePage> { // Класс основной страницы
  int _counter = 0; // Переменная счетчика

  void _incrementCounter() { // Инкрементация счетчика
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){ // Декрементация счетчика
    if (_counter > 0){ // Конструкция чтобы счетчик не уходил в минус
      setState(() {
        _counter--;
      });
    }

  }

  void _setDefault(){ // Установка счетчика в изначальное значение
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) { // Создание вложенного виджета Scaffold
    return Scaffold(
      appBar: AppBar( // Заголовок виджета
        title: Text(widget.title), // Текст в заголовке виджета
      ),
      body: Center( // Тело виджета
        child: Column( // Виджет Column
          mainAxisAlignment: MainAxisAlignment.center, // Центрирование виджета
          children: <Widget>[ // Массив вложенных виджетов
            const Text( // Вложенный текст
              'Значение инкремента:', // Значение текста
              textAlign: TextAlign.center, // Выравнение по центру
              style: TextStyle(
                fontSize: 45.0, // Размер шрифта надписи "Значение инкремента"
              ),
            ),
            Text( // Текст, показывающий счетчик
              '$_counter', // Вывод переменной счетчика
              style: const TextStyle(
                fontSize: 120.0, // Размер шрифта
              ),
            ),
            Row( // Виджет строки
              mainAxisAlignment: MainAxisAlignment.center, // Выравнивание по центру
              children: [ // Вложенные виджеты
                TextButton( // Кнопка декрементации
                    onPressed: _decrementCounter, // Функция, вызываемая при нажатии
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black, // Цвет текста на кнопке
                      backgroundColor: Colors.red, // Цвет фона кнопки
                      fixedSize: const Size(90.0, 40.0), // Размеры кнопки
                    ),
                    child: const Icon(Icons.remove) // Иконка на кнопке
                ),
                TextButton( // Кнопка инкрементации
                  onPressed: _incrementCounter, // Функция, вызываемая при нажатии
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // Цвет текста на кнопке
                    backgroundColor: Colors.green, // Цвет фона кнопки
                    fixedSize: const Size(90.0, 40.0) // Размер кнопки
                  ),
                  child: const Icon(Icons.add), // Иконка на кнопке
                ),
              ],
            ),
            TextButton( // Кнопка сброса счетчика
              onPressed: _setDefault, // Функция, вызываемая при нажатии
              style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory // Изменение стиля всплеска от нажатия
              ),
              child: const Text( // Текст на кнопке
                'СБРОСИТЬ', // Значение текста
                style: TextStyle(
                  fontSize: 30, // Размер шрифта текста
                  color: Colors.grey, // Цвет текста
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
