import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => const MainScreen(),

    },
  ));
}

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Главное окно'),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){},
          child: const Text('asdf'),
        ),
      ),
    );
  }
}


