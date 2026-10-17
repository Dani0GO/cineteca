import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Muestra una calificación de 0 a 5 con estrellas.
class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final bool showValue;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 16,
    this.showValue = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 1; i <= 5; i++)
          Icon(
            rating >= i
                ? Icons.star_rounded
                : rating >= i - 0.5
                    ? Icons.star_half_rounded
                    : Icons.star_outline_rounded,
            size: size,
            color: AppColors.accent,
          ),
        if (showValue) ...[
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(fontSize: size * 0.8, color: AppColors.textSecondary),
          ),
        ],
      ],
    );
  }
}
