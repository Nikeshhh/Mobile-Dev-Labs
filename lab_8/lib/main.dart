import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'photo_gallery.dart';
import 'kubsau_feed.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}



void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    const title = 'Фотогалерея';
    const feed_title = 'Лента новостей КубГАУ';

    return MaterialApp(
      initialRoute: '/',
      title: title,
      routes: {
        '/': (BuildContext context) => const MySelector(title: title),
        'photo_gallery': (BuildContext context) => const MyPhotoGallery(title: title),
        'feed': (BuildContext context) => const MyFeed(title: feed_title),
      },
    );
  }
}

class MySelector extends StatelessWidget {
  const MySelector({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'photo_gallery');
              },
              child: const Text('Фотогалерея'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'feed');
              },
              child: const Text('Новости КубГАУ'),
            )
          ],
        ),
      )
    );
  }
}