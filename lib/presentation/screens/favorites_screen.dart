import 'package:flutter/material.dart';

import '../../domain/services/movie_service.dart';
import '../widgets/empty_state.dart';
import '../widgets/movie_list_tile.dart';
import 'movie_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = MovieService.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Mis favoritos')),
      body: ValueListenableBuilder<Set<int>>(
        valueListenable: service.favorites,
        builder: (context, favs, child) {
          final movies = service.favoriteMovies;
          if (movies.isEmpty) {
            return const EmptyState(
              icon: Icons.favorite_border,
              message: 'Aún no tienes favoritos.\nToca el corazón en cualquier película.',
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: movies.length,
            itemBuilder: (context, i) => MovieListTile(
              movie: movies[i],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: movies[i])),
              ),
            ),
          );
        },
      ),
    );
  }
}
