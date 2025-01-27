import 'dart:convert';
import 'package:fl_damflix/models/popular_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_damflix/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'c76ed6d50b96d2bfc0920abaeade0be3';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Result> onDisplayMovies = [];
  List<Result> popularMovies = [];

  MoviesProvider() {
    print('MoviesProvider esta inicializado');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  getOnDisplayMovies() async {
    //print('getOnDisplayMovies');
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    var response = await http.get(url);

    //final Map<String, dynamic> decodedData = json.decode(response.body);
    final nowPlayingResponse = MovieResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    var response = await http.get(url);

    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];
    // popularMovies = popularResponse.results;
    notifyListeners();
  }
}
