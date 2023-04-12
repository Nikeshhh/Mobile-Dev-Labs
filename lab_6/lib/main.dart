import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    appBar: AppBar(title: const Text('Калькулятор площади')),
    body: const MyForm(),
  ),
));

class MyForm extends StatefulWidget{
  const MyForm ({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  double _width = 0;
  double _height = 0;
  double _result = 0;
  String _output = 'Введите данные';

  bool _myValidator(val){ // Валидатор
    try{
      double.parse(val);
      return false;
    }
    on Exception {
      return true;
    }
  }

  void _calculate(){ // Функция нажатия на кнопку вычисления
    if (_formKey.currentState!.validate()){
      setState(() {
        _result = _width * _height;
        _output = 'S = $_width * $_height = $_result';
      });
    }
    else{
      setState(() {
        _output = 'Введите данные';
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row( // Первая строка ввода
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Ширина (мм): '),
                ),
                Expanded(
                  child: TextFormField(validator: (value) { // Поле для ввода ширины
                    if (value!.isEmpty || _myValidator(value) || double.parse(value) <= 0) {
                      return "Введенные данные неверны!";
                    }
                    else {
                      _width = double.parse(value); // Получение ширины при успешной валидации
                    }
                  }),
                )
              ],
            ),
            Row( // Вторая строка ввода
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text('Длина (мм): '),
                ),

                Expanded(
                  child: TextFormField(validator: (value) { // Поле для ввода длины
                    if (value!.isEmpty || _myValidator(value) || double.parse(value) <= 0) {
                      return "Введенные данные неверны!";
                    }
                    else {
                      _height = double.parse(value); // Получение длины при успешной валидации
                    }
                  }),
                )
              ],
            ),
            const Divider(height: 30,), // Разделитель
            ElevatedButton( // Кнопка для вычиления значения
              onPressed: _calculate,
              child: const Text('Вычислить'),
            ),
            Text(_output), // Вывод значения
          ],
        ),
      ),
    );
  }
}


