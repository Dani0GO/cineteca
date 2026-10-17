import 'package:flutter/material.dart';

import '../../data/models/movie.dart';
import '../../domain/services/movie_service.dart';
import '../widgets/empty_state.dart';
import '../widgets/movie_list_tile.dart';
import '../widgets/search_field.dart';
import 'movie_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final List<Movie> results = MovieService.instance.search(_query);
    return Scaffold(
      appBar: AppBar(title: const Text('Buscar')),
      body: Column(
        children: [
          SearchField(autofocus: true, onChanged: (v) => setState(() => _query = v)),
          Expanded(
            child: results.isEmpty
                ? EmptyState(
                    icon: Icons.search_off,
                    message: _query.isEmpty
                        ? 'Escribe para buscar películas.'
                        : 'No hay resultados para "$_query".',
                  )
                : ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, i) => MovieListTile(
                      movie: results[i],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MovieDetailScreen(movie: results[i])),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
