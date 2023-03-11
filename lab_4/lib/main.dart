import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

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
  int _counterLikes = 0;
  // Ссылка на место на карте
  String mapsUrl = 'https://yandex.ru/maps/35/krasnodar/?ll=38.924802%2C45.051164&mode=poi&poi%5Bpoint%5D=38.923352%2C45.050769&poi%5Buri%5D=ymapsbm1%3A%2F%2Forg%3Foid%3D174355238585&z=17.25';
  String phoneNumber = '88005553535';
  void _incrementCounter() {
    setState(() {
      _counterLikes++;
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
                ElevatedButton( // Кнопка лайка
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _incrementCounter, // Функция нажатия на кнопку
                  child: const Icon( // Иконка сердечка
                    Icons.favorite,
                    color: Colors.green,
                  ),
                ),
                Text( // Количество лайков
                  '$_counterLikes'
                )
              ],
            ),
            Row( // Строка с кнопками
              children: [
                Expanded(
                  child: Column( // Кнопка позвонить
                    children: [
                      ElevatedButton( // Кнопка позвонить
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => launch(phoneNumber), // Функция нажатия на кнопку звонка
                          child: const Icon( // Иконка звонка
                            Icons.call,
                            color: Colors.green,
                          )
                      ),
                      const Text( // Надпись позвонить
                        'ПОЗВОНИТЬ',
                        style: TextStyle(
                          color: Colors.green
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column( // Кнопка маршрут
                    children: [
                      ElevatedButton(
                          onPressed: () => launch(mapsUrl), // Функция нажатия на кнопку маршрут TODO: Сделать маршрут а не ссылку на место
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.white,
                          ),
                          child: const Icon( // Иконка навигатора
                            Icons.navigation,
                            color: Colors.green,
                          )
                      ),
                      const Text( // Надпись маршрут
                        'МАРШРУТ',
                        style: TextStyle(
                          color: Colors.green
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column( // Кнопка поделиться
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () => Share.share('я в шкафу прячусь'), // Функция нажатия на кнопку поделиться
                        child: const Icon( // Иконка поделиться
                          Icons.share,
                          color: Colors.green,
                        ),
                      ),
                      const Text( // Надпись поделиться
                        'ПОДЕЛИТЬСЯ',
                        style: TextStyle(
                          color: Colors.green
                        ),
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
