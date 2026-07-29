import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:recipy_app/core/constants/api_endpoints.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {'Accept': 'application/json', 'lang': 'en'},
    ),
  );

  // Function to set the correct Content-Type
  Options getDioOptions({bool isMultipart = false}) {
    return Options(
      headers: {
        'Content-Type': isMultipart
            ? 'multipart/form-data'
            : 'application/json',
      },
    );
  }

  ApiServices() {
    Logger log = Logger();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // log.i(
          //   "=======================REQUEST=====================\n"
          //   "Method: ${options.method}\n"
          //   "BaseUrl: ${options.baseUrl}\n"
          //   "Path: ${options.path}\n"
          //   "Query Parameters: ${options.queryParameters}\n"
          //   "Data: ${options.data}\n"
          //   "==================================================",
          // );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // log.i(
          //   "=======================RESPONSE======================\n"
          //   "Status Code: ${response.statusCode}\n"
          //   "Status Message: ${response.statusMessage}\n"
          //   "Headers: ${response.headers}\n"
          //   "Request Options: ${response.requestOptions}\n"
          //   "Is Redirect: ${response.isRedirect}\n"
          //   "Redirects: ${response.redirects}\n"
          //   "Data: ${response.data}\n"
          //   "==================================================",
          // );
          return handler.next(response);
        },
        onError: (error, handler) {
          // log.e(
          //   "=====================Error======================\n"
          //   "Status Code: ${error.response?.statusCode}\n"
          //   "Status Message: ${error.response?.statusMessage}\n"
          //   "Headers: ${error.response?.headers}\n"
          //   "Request Options: ${error.response?.requestOptions}\n"
          //   "==================================================",
          // );
          return handler.next(error);
        },
      ),
    );
  }

  // GET METHOD
  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    Response<dynamic> response = await _dio.get<dynamic>(
      endPoint,
      queryParameters: query,
      data: data,
    );
    return response;
  }

  // POST METHOD
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    Response<dynamic> response = await _dio.post<dynamic>(endPoint, data: data);
    return response.data;
  }

  // POST METHOD WITH FORM DATA
  Future<Map<String, dynamic>> postFormData({
    required String endPoint,
    required FormData data,
  }) async {
    Response<dynamic> response = await _dio.post<dynamic>(
      endPoint,
      data: data,
      options: getDioOptions(isMultipart: true),
    );
    return response.data;
  }

  // PATCH METHOD
  Future<Map<String, dynamic>> patch({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    Response<dynamic> response = await _dio.patch<dynamic>(
      endPoint,
      data: data,
    );
    return response.data;
  }

  // PATCH METHOD WITH FORM DATA
  Future<Map<String, dynamic>> patchFormData({
    required String endPoint,
    required FormData data,
  }) async {
    Response<dynamic> response = await _dio.patch<dynamic>(
      endPoint,
      data: data,
      options: getDioOptions(isMultipart: true),
    );
    return response.data;
  }

  // DELETE METHOD
  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    Response<dynamic> response = await _dio.delete<dynamic>(endPoint);
    return response.data;
  }
}
