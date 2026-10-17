import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Etiqueta compacta de género.
class GenreChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const GenreChip({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: onTap,
      labelStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500),
      backgroundColor: AppColors.secondary.withValues(alpha: 0.2),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
