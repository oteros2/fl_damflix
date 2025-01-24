import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

  final String _apiKey = 'c76ed6d50b96d2bfc0920abaeade0be3';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';


  MoviesProvider(){
    print('MoviesProvider esta inicializado');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
      //print('getOnDisplayMovies');
      var url = Uri.https(_baseUrl, '3/movie/now_playing', {
        'api_key': _apiKey,
        'language': _language,
        'page': '1'
      });
      var response = await http.get(url);

      final Map<String, dynamic> decodedData = json.decode(response.body);
      print(decodedData['results']);
  }


}