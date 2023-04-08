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

class SingleView {
  final String activeFrom;
  final String title;
  final String detailText;
  final String previewPictureSrc;

  const SingleView({
    required this.activeFrom,
    required this.title,
    required this.detailText,
    required this.previewPictureSrc,
  });

  factory SingleView.fromJson(Map<String, dynamic> json){
    return SingleView(
      activeFrom: json['activeFrom'] as String,
      title: json['title'] as String,
      detailText: json['detailText'] as String,
      previewPictureSrc: json['previewPictureSrc'] as String,
    );
  }
}