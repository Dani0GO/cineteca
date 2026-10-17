import 'package:flutter/material.dart';

import '../../domain/services/movie_service.dart';

/// Corazón que marca/desmarca una película como favorita.
class FavoriteButton extends StatelessWidget {
  final int movieId;
  final Color color;

  const FavoriteButton({
    super.key,
    required this.movieId,
    this.color = const Color(0xFFD97A7A),
  });

  @override
  Widget build(BuildContext context) {
    final service = MovieService.instance;
    return ValueListenableBuilder<Set<int>>(
      valueListenable: service.favorites,
      builder: (context, favs, _) {
        final isFav = favs.contains(movieId);
        return IconButton(
          tooltip: isFav ? 'Quitar de favoritos' : 'Agregar a favoritos',
          icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: color),
          onPressed: () => service.toggleFavorite(movieId),
        );
      },
    );
  }
}
