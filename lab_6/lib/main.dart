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

  bool _myValidator(val){
    try{
      double.parse(val);
      return true;
    }
    on Exception {
      return false;
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
                  child: TextFormField(validator: (value) {
                    if (value!.isEmpty || _myValidator(value) || double.parse(value) <= 0) {
                      return "Введенные данные неверны!";
                    }
                    else {
                      _width = double.parse(value);
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
                  child: TextFormField(validator: (value) {
                    if (value!.isEmpty || _myValidator(value) || double.parse(value) <= 0) {
                      return "Введенные данные неверны!";
                    }
                    else {
                      _height = double.parse(value);
                    }
                  }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


