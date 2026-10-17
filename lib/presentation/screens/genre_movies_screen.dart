import 'package:flutter/material.dart';

import '../../data/models/genre.dart';
import '../../domain/services/movie_service.dart';
import '../widgets/empty_state.dart';
import '../widgets/movie_list_tile.dart';
import 'movie_detail_screen.dart';

class GenreMoviesScreen extends StatelessWidget {
  final Genre genre;

  const GenreMoviesScreen({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    final movies = MovieService.instance.byGenre(genre.id);
    return Scaffold(
      appBar: AppBar(title: Text(genre.name)),
      body: movies.isEmpty
          ? const EmptyState(icon: Icons.movie_filter_outlined, message: 'Sin películas en este género.')
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: movies.length,
              itemBuilder: (context, i) => MovieListTile(
                movie: movies[i],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: movies[i])),
                ),
              ),
            ),
    );
  }
}
