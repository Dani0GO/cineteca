import 'package:flutter/material.dart';

import '../../domain/services/movie_service.dart';
import '../widgets/genre_tile.dart';
import 'genre_movies_screen.dart';

class GenresScreen extends StatelessWidget {
  const GenresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = MovieService.instance;
    final genres = service.genres;
    return Scaffold(
      appBar: AppBar(title: const Text('Géneros')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.1,
        ),
        itemCount: genres.length,
        itemBuilder: (context, i) {
          final genre = genres[i];
          return GenreTile(
            genre: genre,
            movieCount: service.byGenre(genre.id).length,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GenreMoviesScreen(genre: genre)),
            ),
          );
        },
      ),
    );
  }
}
