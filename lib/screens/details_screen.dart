import 'package:fl_damflix/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              //Text('Prueba numero 1'),
              const _InfoPelicula(),
              const _Overview(),
              const CastCarrousel()
            ]),
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

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
          child: const Text('pelicula.titulo', style: TextStyle(color: Colors.white),)
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://es.web.img2.acsta.net/medias/nmedia/18/35/41/59/18831270.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _InfoPelicula extends StatelessWidget {
  const _InfoPelicula({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://www.starwarsnewsnet.com/wp-content/uploads/2016/07/Starlog-02.jpg'),
              height: 250,
            ),
          ),

          const SizedBox( width: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('pelicula.titulo', style: Theme.of(context).textTheme.titleLarge, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('pelicula.year', style: Theme.of(context).textTheme.titleSmall,),
              Text('pelicula.director', style: Theme.of(context).textTheme.titleSmall,),
              
              Row(
                children: [
                  const Icon(Icons.star, size: 25, color: Colors.yellow),
                  Text('pelicula.valoracion', style: Theme.of(context).textTheme.titleSmall,)
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
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text('Ipsum eiusmod deserunt pariatur pariatur proident ex nostrud laborum commodo consectetur duis proident Lorem. Ex sunt occaecat commodo dolore sit qui irure irure fugiat quis. Nostrud laborum irure eu reprehenderit sunt aliquip nostrud laborum qui sunt consequat. Excepteur est ullamco do non cillum irure aliqua. Elit consectetur aliquip consectetur aliquip velit irure ad laboris officia sint occaecat. Excepteur et velit do cupidatat labore qui deserunt eiusmod id nulla consectetur.', textAlign: TextAlign.justify, style: Theme.of(context).textTheme.titleSmall,),
    );
  }
}

