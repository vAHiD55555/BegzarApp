import 'package:dio/dio.dart';

final httpClient = Dio(
  BaseOptions(
    baseUrl: '',
    headers: {
      'X-Content-Type-Options': 'nosniff',
    },
  ),
);
