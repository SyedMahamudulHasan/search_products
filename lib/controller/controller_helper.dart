import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ConnectionHelper {
  Future<Response<dynamic>?> getData(
    String url, {
    Map<String, dynamic>? query,
  }) async {
    try {
      // Starting Timer
      DateTime stime = DateTime.now();

      Dio dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      // Request to API
      var response = await dio.get(url,
          //queryParameters: query,
          options: Options(
            sendTimeout: 10000,
            receiveTimeout: 10000,
          ));

      // Ending Timer
      DateTime etime = DateTime.now();

      // Calculating Time
      Duration diff = etime.difference(stime);

      // Printing Results
      print(url + ": " + diff.inMilliseconds.toString() + " Milliseconds");

      return response;
    } on DioError catch (error) {
      print(error);
      return error.response;
    }
  }
}
