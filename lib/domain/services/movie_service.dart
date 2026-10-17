import 'package:flutter/foundation.dart';

import '../../data/datasources/movie_local_datasource.dart';
import '../../data/models/genre.dart';
import '../../data/models/movie.dart';
import '../../data/repositories/movie_repository.dart';

/// Capa de lógica de negocio: búsqueda, filtros y favoritos.
/// Las pantallas solo hablan con este servicio, nunca con el JSON.
class MovieService {
  MovieService._(this._repository);

  static final MovieService instance =
      MovieService._(MovieRepository(MovieLocalDataSource()));

  final MovieRepository _repository;

  List<Movie> _movies = [];
  List<Genre> _genres = [];

  /// Ids de películas favoritas; las pantallas escuchan sus cambios.
  final ValueNotifier<Set<int>> favorites = ValueNotifier<Set<int>>({});

  Future<void> load() async {
    if (_movies.isNotEmpty) return;
    _movies = await _repository.getMovies();
    _genres = await _repository.getGenres();
  }

  List<Movie> get movies => List.unmodifiable(_movies);
  List<Genre> get genres => List.unmodifiable(_genres);

  List<Movie> get topRated {
    final sorted = [..._movies]..sort((a, b) => b.rating.compareTo(a.rating));
    return sorted.take(5).toList();
  }

  List<Movie> byGenre(String genreId) =>
      _movies.where((m) => m.genreId == genreId).toList();

  Genre genreOf(Movie movie) =>
      _genres.firstWhere((g) => g.id == movie.genreId);

  List<Movie> search(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return [];
    return _movies
        .where((m) =>
            m.title.toLowerCase().contains(q) ||
            m.director.toLowerCase().contains(q))
        .toList();
  }

  bool isFavorite(int id) => favorites.value.contains(id);

  void toggleFavorite(int id) {
    final next = {...favorites.value};
    if (!next.remove(id)) next.add(id);
    favorites.value = next;
  }

  List<Movie> get favoriteMovies =>
      _movies.where((m) => favorites.value.contains(m.id)).toList();
}
