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

  @override
  Widget build(BuildContext context) {
    return Container()
  }
}


