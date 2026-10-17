import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../data/models/genre.dart';

/// Tarjeta cuadrada de género para la cuadrícula de categorías.
class GenreTile extends StatelessWidget {
  final Genre genre;
  final int movieCount;
  final VoidCallback onTap;

  const GenreTile({
    super.key,
    required this.genre,
    required this.movieCount,
    required this.onTap,
  });

  static const Map<String, IconData> _icons = {
    'theater': Icons.theater_comedy_outlined,
    'rocket': Icons.rocket_launch_outlined,
    'palette': Icons.palette_outlined,
    'smile': Icons.sentiment_satisfied_alt_outlined,
    'eye': Icons.visibility_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.secondary.withValues(alpha: 0.25),
                child: Icon(_icons[genre.icon] ?? Icons.movie_outlined,
                    color: AppColors.primary),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(genre.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                  Text('$movieCount películas',
                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
