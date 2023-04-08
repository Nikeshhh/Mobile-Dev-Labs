import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
        ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  }
}

Future<List<SingleNew>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse('https://kubsau.ru/api/getNews.php?key=6df2f5d38d4e16b5a923a6d4873e2ee295d0ac90'));
  return compute(parseNews, response.body);
}

List<SingleNew> parseNews(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<SingleNew>((json) => SingleNew.fromJson(json)).toList();
}

class SingleNew {
  final String activeFrom;
  final String title;
  final String detailText;
  final String previewPictureSrc;

  const SingleNew({
    required this.activeFrom,
    required this.title,
    required this.detailText,
    required this.previewPictureSrc,
  });

  factory SingleNew.fromJson(Map<String, dynamic> json){
    return SingleNew(
      activeFrom: json['activeFrom'] as String,
      title: json['title'] as String,
      detailText: json['detailText'] as String,
      previewPictureSrc: json['previewPictureSrc'] as String,
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.news}) : super(key: key);

  final List<SingleNew> news;

  @override
  Widget build(BuildContext context){
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: news.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.network(news[index].previewPictureSrc),
            Text(news[index].activeFrom),
            Text(news[index].title),
            Text(news[index].detailText)
          ],
        );
        // Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}

class MyFeed extends StatelessWidget {
  const MyFeed({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<SingleNew>>(
          future: fetchPhotos(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError){
              return const Center(
                child: Text('Ошибка при выполнении запроса!'),
              );
            }
            else if (snapshot.hasData){
              return NewsList(news: snapshot.data!);
            }
            else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}