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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Инкремент'),
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

  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }

  void _setDefault(){
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Значение инкремента:',
              style: TextStyle(
                fontSize: _counter.toDouble()
              ),
            ),
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 120.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: _decrementCounter,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.red,
                      fixedSize: const Size(90.0, 40.0),
                    ),
                    child: const Icon(Icons.remove)
                ),
                TextButton(
                  onPressed: _incrementCounter,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.green,
                    fixedSize: const Size(90.0, 40.0)
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            TextButton(
              onPressed: _setDefault,
              style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory
              ),
              child: const Text(
                'СБРОСИТЬ',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
