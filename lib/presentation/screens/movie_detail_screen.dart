import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../data/models/movie.dart';
import '../../domain/services/movie_service.dart';
import '../widgets/cast_avatar.dart';
import '../widgets/favorite_button.dart';
import '../widgets/genre_chip.dart';
import '../widgets/info_badge.dart';
import '../widgets/movie_poster.dart';
import '../widgets/rating_stars.dart';
import '../widgets/section_title.dart';
import 'genre_movies_screen.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final genre = MovieService.instance.genreOf(movie);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            actions: [FavoriteButton(movieId: movie.id)],
            flexibleSpace: FlexibleSpaceBar(
              background: MoviePoster(url: movie.backdrop, radius: 0),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'poster-${movie.id}',
                    child: MoviePoster(url: movie.poster, width: 100, height: 150),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title,
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 6),
                        RatingStars(rating: movie.rating, size: 18),
                        const SizedBox(height: 10),
                        GenreChip(
                          label: genre.name,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => GenreMoviesScreen(genre: genre)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  InfoBadge(icon: Icons.calendar_today_outlined, text: '${movie.year}'),
                  InfoBadge(icon: Icons.schedule, text: movie.durationLabel),
                  InfoBadge(icon: Icons.person_outline, text: movie.director),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SectionTitle(title: 'Sinopsis')),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(movie.synopsis,
                  style: const TextStyle(height: 1.5, color: AppColors.textSecondary)),
            ),
          ),
          const SliverToBoxAdapter(child: SectionTitle(title: 'Reparto')),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [for (final c in movie.cast) CastAvatar(member: c)],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
