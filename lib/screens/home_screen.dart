import 'package:fl_damflix/providers/movies_provider.dart';
import 'package:fl_damflix/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context).onDisplayMovies;
    final popularProvider = Provider.of<MoviesProvider>(context).popularMovies;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Damflix'),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider),
            MovieSlider(popularMovies: popularProvider)
          ]
        ),
      ),
    );
  }
}