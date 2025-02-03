import 'dart:math';

import 'package:fl_damflix/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

  final Result movie = ModalRoute.of(context)!.settings.arguments as Result;
  final int movieId = movie.id;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              //Text('Prueba numero 1'),
              _InfoPelicula(movie: movie),
              const SizedBox(height: 20),
              _Overview(movie: movie),
              const SizedBox(height: 20),
              CastCarrousel(movieId: movieId),
            ]),
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Result movie;
  const _CustomAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: true, 
      pinned: true, 
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          color: const Color.fromARGB(136, 107, 77, 77),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movie.title, style: const TextStyle(color: Colors.white),),
          )
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'), 
          image: NetworkImage(movie.backDropImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _InfoPelicula extends StatelessWidget {
  final Result movie;
  const _InfoPelicula({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(movie.fullPosterImg),
              height: 250,
            ),
          ),

          const SizedBox( width: 20,),

          Container(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Título original:', style: Theme.of(context).textTheme.titleMedium,),
                Text(movie.originalTitle, style: Theme.of(context).textTheme.titleMedium,),
                Text('Fecha de lanzamiento:', style: Theme.of(context).textTheme.titleSmall,),
                Text(movie.releaseDate.toString().substring(0,10), style: Theme.of(context).textTheme.titleSmall,),
                //Text(movie.id.toStringAsFixed(1), style: Theme.of(context).textTheme.titleSmall,),
                Row(
                  children: [
                    const Icon(Icons.star, size: 25, color: Colors.yellow),
                    Text(movie.voteAverage.toStringAsFixed(1), style: Theme.of(context).textTheme.titleSmall,)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Result movie;
  const _Overview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(movie.overview, textAlign: TextAlign.justify, style: Theme.of(context).textTheme.titleSmall,),
    );
  }
}

