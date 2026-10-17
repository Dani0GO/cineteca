import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../data/models/movie.dart';
import 'favorite_button.dart';
import 'movie_poster.dart';
import 'rating_stars.dart';

/// Fila horizontal para listas (búsqueda, género, favoritos).
class MovieListTile extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieListTile({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.surface,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              MoviePoster(url: movie.poster, width: 60, height: 90, radius: 8),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                    const SizedBox(height: 4),
                    Text('${movie.year} · ${movie.durationLabel}',
                        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    const SizedBox(height: 6),
                    RatingStars(rating: movie.rating, size: 14),
                  ],
                ),
              ),
              FavoriteButton(movieId: movie.id),
            ],
          ),
        ),
      ),
    );
  }
}
