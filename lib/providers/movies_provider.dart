import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{
  MoviesProvider(){
    print('MoviesProvider esta inicializado');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
      print('getOnDisplayMovies');
  }


}