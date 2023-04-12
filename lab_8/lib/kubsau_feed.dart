import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//     const title = 'Новости КУБГАУ';
//
//     return const MaterialApp(
//       title: title,
//       home: MyFeed(title: title),
//     );
//   }
// }

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
  final String previewText;
  final String previewPictureSrc;

  const SingleNew({
    required this.activeFrom,
    required this.title,
    required this.previewText,
    required this.previewPictureSrc,
  });

  factory SingleNew.fromJson(Map<String, dynamic> json){
    return SingleNew(
      activeFrom: json['ACTIVE_FROM'] as String,
      title: json['TITLE'] as String,
      previewText: json['PREVIEW_TEXT'] as String,
      previewPictureSrc: json['PREVIEW_PICTURE_SRC'] as String,
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.news}) : super(key: key);

  final List<SingleNew> news;

  @override
  Widget build(BuildContext context){
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemCount: news.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: double.infinity,
          child: Card(
            child: Column(
              children: [
                Image.network(news[index].previewPictureSrc),
                ListTile(
                  title: Text(news[index].title),
                  subtitle: Text(news[index].activeFrom),
                ),
                ListTile(
                  title: Text(Bidi.stripHtmlIfNeeded(news[index].previewText)),
                ),
              ],
            ),
          )
        );
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
              return Center(
                child: Text(snapshot.error.toString()),
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