import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body:
      ListView( // Виджет с прокруткой
          children: [
              Container( // Виджет для изображения
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black)
                ),
                child: Image.asset('assets/images/sample_image.jpg'),
              ),
            Row( // Строка с основной информацией
              children: [
                const Expanded(
                  child: ListTile( // Лист тайл с названием общаги и адресом
                    title: Text(
                        'sample title'
                    ), // Название
                    subtitle: Text(
                        'Sample address'
                    ), // Адрес
                  ),
                ),
                ElevatedButton(
                  onPressed: _incrementCounter, // Функция нажатия на кнопку TODO: Заглушка на кнопке
                  child: const Icon( // Иконка сердечка
                    Icons.label
                  ),
                ),
                const Text( // Количество лайков
                  'Likes'
                )
              ],
            ),
            Row( // Строка с кнопками
              children: [
                Expanded(
                  child: Column( // Кнопка позвонить
                    children: [
                      ElevatedButton( // Кнопка позвонить
                          onPressed: () => launch('tel://88005553535'), // Функция нажатия на кнопку звонка
                          child: const Icon( // Иконка звонка
                            Icons.call
                          )
                      ),
                      const Text( // Надпись позвонить
                        'ПОЗВОНИТЬ'
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column( // Кнопка маршрут
                    children: [
                      ElevatedButton(
                          onPressed: _incrementCounter, // Функция нажатия на кнопку TODO: Заглушка на кнопке
                          child: const Icon( // Иконка навигатора
                            Icons.navigation
                          )
                      ),
                      const Text( // Надпись маршрут
                        'МАРШРУТ'
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column( // Кнопка поделиться
                    children: [
                      ElevatedButton(
                        onPressed: _incrementCounter, // Функция нажатия на кнопку TODO: Заглушка на кнопке,
                        child: const Icon( // Иконка поделиться
                          Icons.share
                        ),
                      ),
                      const Text( // Надпись поделиться
                        'ПОДЕЛИТЬСЯ'
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Divider( // Разделитель кнопок от текста
              height: 20,
            ),
            const Text( // Нижний текст
              'Ну очень длинный текст фаыва ыва лвфыта одйта цудоа цуйода а уцйоадуцдацуайуцад'
            ),
          ],
      ),
    );
  }
}
