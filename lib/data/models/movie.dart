import 'cast_member.dart';

class Movie {
  final int id;
  final String title;
  final int year;
  final int duration; // minutos
  final double rating; // 0 a 5
  final String genreId;
  final String director;
  final String synopsis;
  final String poster;
  final String backdrop;
  final List<CastMember> cast;

  const Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.duration,
    required this.rating,
    required this.genreId,
    required this.director,
    required this.synopsis,
    required this.poster,
    required this.backdrop,
    required this.cast,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'] as int,
        title: json['title'] as String,
        year: json['year'] as int,
        duration: json['duration'] as int,
        rating: (json['rating'] as num).toDouble(),
        genreId: json['genreId'] as String,
        director: json['director'] as String,
        synopsis: json['synopsis'] as String,
        poster: json['poster'] as String,
        backdrop: json['backdrop'] as String,
        cast: (json['cast'] as List<dynamic>)
            .map((e) => CastMember.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'year': year,
        'duration': duration,
        'rating': rating,
        'genreId': genreId,
        'director': director,
        'synopsis': synopsis,
        'poster': poster,
        'backdrop': backdrop,
        'cast': cast.map((c) => c.toJson()).toList(),
      };

  String get durationLabel => '${duration ~/ 60}h ${duration % 60}min';
}
