import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://www.googleapis.com/youtube/v3',
  ),
);