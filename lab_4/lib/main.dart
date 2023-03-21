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

  // Количество лайков
  int _counterLikes = 0;
  // Ссылка на место на карте
  String mapsUrl = 'https://yandex.ru/maps/?ll=39.393598%2C46.148998&mode=routes&rtext=~45.050742%2C38.923417&rtt=mt&ruri=~ymapsbm1%3A%2F%2Fgeo%3Fdata%3DCgk3NzI4MjE4ODUSUNCg0L7RgdGB0LjRjywg0JrRgNCw0YHQvdC-0LTQsNGALCDRg9C70LjRhtCwINC40LzQtdC90Lgg0JrQsNC70LjQvdC40L3QsCwgMTPQujE4IgoNlbEbQhX2MzRC&z=8.07';
  // Номер телефона
  String phoneNumber = 'tel://88005553535';
  // Название
  String nameDorm = 'Общежитие №18';
  // Адрес
  String addressDorm = 'ул. Калинина, 13к18';
  // Описание
  String description = 'Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.';
  // Цвет иконки лайка
  MaterialColor _likeIconColor = Colors.green;
  // Нажата ли кнопка лайка
  bool _likeButtonPushed = false;

  void _incrementCounter() {// Инкремент количества лайков
      setState(() {
        _counterLikes++;
      });
  }

  void _decrementCounter(){ // Декремент количества лайков
    setState(() {
      _counterLikes--;
    });
  }

  void _pushLike() { // Функция нажатия кнопки лайка
    _likeButtonPushed = !_likeButtonPushed; //
    if (_likeButtonPushed){
      setState(() {
        _likeIconColor = Colors.red;
      });
      _incrementCounter();
    }
    else {
      setState(() {
        _likeIconColor = Colors.green;
      });
      _decrementCounter();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        // Виджет с прокруткой
        children: [
          Image.asset('assets/images/dorm_18.jpg'), // Изображение
          Row(
            // Строка с основной информацией
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 310,
                child: ListTile(
                  // Лист тайл с названием общаги и адресом
                  title: Text(
                    nameDorm,
                  ), // Название
                  subtitle: Text(
                    addressDorm,
                  ), // Адрес
                ),
              ),
              TextButton(
                // Кнопка лайка
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                ),
                onPressed: _pushLike, // Функция нажатия на кнопку
                child: Icon(
                  // Иконка сердечка
                  Icons.favorite,
                  color: _likeIconColor,
                ),
              ),
              Text( // Количество лайков
                  '$_counterLikes')
            ],
          ),
          const Divider( // Разделитель заголовка от кнопок
            height: 20,
          ),
          Row( // Строка с кнопками
            children: [
              Expanded(
                child: Column(
                  // Кнопка позвонить
                  children: [
                    TextButton(
                        // Кнопка позвонить
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () => launch(phoneNumber),
                        // Функция нажатия на кнопку звонка
                        child: Column(
                          children: const [
                            Icon(
                              // Иконка звонка
                              Icons.call,
                              color: Colors.green,
                            ),
                            Divider(
                              height: 14,
                            ),
                            Text(
                              // Надпись позвонить
                              'ПОЗВОНИТЬ',
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  // Кнопка маршрут
                  children: [
                    TextButton(
                        onPressed: () => launch(mapsUrl),
                        // Функция нажатия на кнопку маршрут TODO: Сделать маршрут а не ссылку на место
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                        ),
                        child: Column(
                          children: const [
                            Icon(
                              // Иконка навигатора
                              Icons.navigation,
                              color: Colors.green,
                            ),
                            Divider(
                              height: 14,
                            ),
                            Text(
                              // Надпись маршрут
                              'МАРШРУТ',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  // Кнопка поделиться
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () => Share.share(nameDorm),
                        // Функция нажатия на кнопку поделиться
                        child: Column(
                          children: const [
                            Icon(
                              // Иконка поделиться
                              Icons.share,
                              color: Colors.green,
                            ),
                            Divider(
                              height: 14,
                            ),
                            Text(
                              // Надпись поделиться
                              'ПОДЕЛИТЬСЯ',
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider( // Разделитель кнопок от текста
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 380,
                child: Text( // Нижний текст
                  description,
                ),
            ),]
          ),
        ],
      ),
    );
  }
}
