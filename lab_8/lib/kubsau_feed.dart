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

