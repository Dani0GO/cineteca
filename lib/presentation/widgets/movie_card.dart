import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../data/models/movie.dart';
import 'movie_poster.dart';
import 'rating_stars.dart';

/// Tarjeta vertical (póster + título) para carruseles horizontales.
class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  final double width;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
    this.width = 130,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'poster-${movie.id}',
              child: MoviePoster(url: movie.poster, width: width, height: width * 1.5),
            ),
            const SizedBox(height: 8),
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text('${movie.year}',
                style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            RatingStars(rating: movie.rating, size: 12),
          ],
        ),
      ),
    );
  }
}
