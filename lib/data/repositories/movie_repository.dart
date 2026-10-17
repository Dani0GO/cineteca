import '../datasources/movie_local_datasource.dart';
import '../models/genre.dart';
import '../models/movie.dart';

/// Convierte el JSON crudo en modelos tipados.
class MovieRepository {
  final MovieLocalDataSource _dataSource;

  MovieRepository(this._dataSource);

  Future<List<Movie>> getMovies() async {
    final raw = await _dataSource.loadRaw();
    return (raw['movies'] as List<dynamic>)
        .map((e) => Movie.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<Genre>> getGenres() async {
    final raw = await _dataSource.loadRaw();
    return (raw['genres'] as List<dynamic>)
        .map((e) => Genre.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
