import 'dart:convert';

import 'package:flutter/services.dart';

/// Capa de datos: lee el JSON local desde los assets.
class MovieLocalDataSource {
  static const String _path = 'assets/data/movies.json';

  Future<Map<String, dynamic>> loadRaw() async {
    final text = await rootBundle.loadString(_path);
    return jsonDecode(text) as Map<String, dynamic>;
  }
}
