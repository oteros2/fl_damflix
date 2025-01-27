import 'package:fl_damflix/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

  final Result movie = ModalRoute.of(context)!.settings.arguments as Result;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              //Text('Prueba numero 1'),
              _InfoPelicula(movie: movie),
              _Overview(movie: movie),
              const CastCarrousel(),
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
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(movie.title, style: const TextStyle(color: Colors.white),)
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

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.originalTitle, style: Theme.of(context).textTheme.titleLarge, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text(movie.releaseDate.toString(), style: Theme.of(context).textTheme.titleSmall,),
              Text(movie.voteAverage.toString(), style: Theme.of(context).textTheme.titleSmall,),
              
              Row(
                children: [
                  const Icon(Icons.star, size: 25, color: Colors.yellow),
                  Text(movie.voteAverage.toString(), style: Theme.of(context).textTheme.titleSmall,)
                ],
              )
            ],
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

