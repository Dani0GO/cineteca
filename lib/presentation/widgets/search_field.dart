import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Campo de búsqueda redondeado.
class SearchField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hint;
  final bool autofocus;

  const SearchField({
    super.key,
    required this.onChanged,
    this.hint = 'Buscar por título o director',
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        autofocus: autofocus,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
          filled: true,
          fillColor: AppColors.surface,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
