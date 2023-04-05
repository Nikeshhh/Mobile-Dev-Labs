import 'package:flutter/material.dart';

void main() {
  runApp(MyForm());
}

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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row( // Первая строка ввода
              children: [
                const Text('Ширина (мм): '),
                TextFormField(validator: (value){
                  if (value!.isEmpty || )
                })
              ],
            ),
            Row( // Вторая строка ввода

            )
          ],
        ),
      ),
    )
  }
}


