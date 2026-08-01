import 'package:dio/dio.dart';

class ServerException implements Exception {
  final DioException exception;

  ServerException({required this.exception});
}
