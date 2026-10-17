import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../data/models/cast_member.dart';

/// Foto circular de un actor con su nombre y personaje.
class CastAvatar extends StatelessWidget {
  final CastMember member;

  const CastAvatar({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: AppColors.divider,
            backgroundImage: NetworkImage(member.photo),
          ),
          const SizedBox(height: 6),
          Text(member.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          Text(member.role,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
