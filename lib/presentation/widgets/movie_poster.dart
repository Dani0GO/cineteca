import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Imagen remota con bordes redondeados, carga y error controlados.
class MoviePoster extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double radius;

  const MoviePoster({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) => progress == null
            ? child
            : Container(
                width: width,
                height: height,
                color: AppColors.divider,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(strokeWidth: 2),
              ),
        errorBuilder: (context, error, stack) => Container(
          width: width,
          height: height,
          color: AppColors.divider,
          alignment: Alignment.center,
          child: const Icon(Icons.movie_outlined, color: AppColors.textSecondary),
        ),
      ),
    );
  }
}
