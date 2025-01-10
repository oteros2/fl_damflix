import 'package:fl_damflix/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Damflix'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: const Column(
        children: [
          CardSwiper(),
        ],
      ),
    );
  }
}