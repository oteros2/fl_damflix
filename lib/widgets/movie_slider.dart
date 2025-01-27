import 'package:fl_damflix/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key, required this.popularMovies});

  final List<Result2> popularMovies;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 315,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding:EdgeInsets.all(15),
            child: Text('Favoritas', style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold),)
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularMovies.length,
              itemBuilder: (context, index){
                final movie = popularMovies[index];
                print(movie);
                return _MoviePoster(movie: movie);
              }
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Result2 movie;

  const _MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric( horizontal: 10),
      child: Column(
        children: [
          // Cartel
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover
                ),
            ),
          ),
          const SizedBox( height: 8),
          // Titulo
          Text(movie.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}