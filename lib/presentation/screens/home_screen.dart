import 'package:flutter/material.dart';

import '../../data/models/movie.dart';
import '../../domain/services/movie_service.dart';
import '../widgets/empty_state.dart';
import '../widgets/genre_chip.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_list_tile.dart';
import '../widgets/section_title.dart';
import 'favorites_screen.dart';
import 'genre_movies_screen.dart';
import 'genres_screen.dart';
import 'movie_detail_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieService _service = MovieService.instance;
  late final Future<void> _loading = _service.load();

  void _openDetail(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: movie)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cineteca', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const SearchScreen())),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const FavoritesScreen())),
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: _loading,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const EmptyState(
                icon: Icons.error_outline, message: 'No se pudieron cargar los datos.');
          }
          return ListView(
            children: [
              const SectionTitle(title: 'Top recomendadas'),
              SizedBox(
                height: 270,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _service.topRated.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (_, i) {
                    final movie = _service.topRated[i];
                    return MovieCard(movie: movie, onTap: () => _openDetail(movie));
                  },
                ),
              ),
              SectionTitle(
                title: 'Géneros',
                actionLabel: 'Ver todo',
                onAction: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const GenresScreen())),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final genre in _service.genres)
                      GenreChip(
                        label: genre.name,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => GenreMoviesScreen(genre: genre)),
                        ),
                      ),
                  ],
                ),
              ),
              const SectionTitle(title: 'Catálogo completo'),
              for (final movie in _service.movies)
                MovieListTile(movie: movie, onTap: () => _openDetail(movie)),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
