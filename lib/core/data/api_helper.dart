import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news/core/data/api.dart';

class ApiHelper {
  Dio dio = Dio(BaseOptions(baseUrl: ApiKey.baseURL));

  getData({required String endpoint, Map<String, dynamic>? query}) async {
    try {
      final result = await InternetAddress.lookup('google.com');

      bool hasNet =
          result.isNotEmpty && result[0].rawAddress.isNotEmpty;

      if (!hasNet) {
        throw Exception("No Internet Connection");
      }
    final response = await dio.get(endpoint, queryParameters: query);
    var list = response.data["articles"];
    return list;
    } on SocketException {
      throw Exception("No Internet Connection");
    }
  }


  Future<List> hasInternet(Future? fun) async {
    try {
      final result = await InternetAddress.lookup('google.com');

      bool hasNet =
          result.isNotEmpty && result[0].rawAddress.isNotEmpty;

      if (!hasNet) {
        throw Exception("No Internet Connection");
      }

      return await fun;
    } on SocketException {
      throw Exception("No Internet Connection");
    }
  }
}
