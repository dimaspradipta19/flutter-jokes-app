import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_jokes/model/jokes_model.dart';

class JokesService {
  Future<RandomJokesModel?> fetchJokes() async {
    final Dio dio = Dio();
    const String url =
        "https://api.humorapi.com/jokes/random?api-key=8e6e80109ee84940952bd9cd8f096ddb";

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return RandomJokesModel.fromJson(response.data);
      } else {
        throw Exception("Error, status code ${response.statusCode}");
      }
    } on DioError catch (error) {
      log(error.toString());
      return null;
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}



/* Open Ai recomendation */

// class JokesService {
//   final Dio _dio = Dio();
//   final String _apiKey = "8e6e80109ee84940952bd9cd8f096ddb";

//   JokesService._privateConstructor();

//   static final JokesService instance = JokesService._privateConstructor();

//   Future<RandomJokesModel?> fetchJokes(String url) async {
//     try {
//       final response = await _dio.get(url);
//       return RandomJokesModel.fromJson(response.data);
//     } catch (e) {
//       log(e.toString());
//       rethrow;
//     }
//   }

//   String getJokesUrl() {
//     return "https://api.humorapi.com/jokes/random?api-key=$_apiKey";
//   }
// }
