import 'package:dio/dio.dart';
import 'package:movie_app/utils/constants.dart';

final dioOptions = BaseOptions(
  baseUrl: 'https://api.themoviedb.org/3',
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/json;charset=utf-8',
  headers: {'Authorization': 'Bearer ${Constants.apiKey}'},
);
