import 'package:flutter/material.dart';
import 'package:app_project/providers/app_state.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Panggil fungsi removeFavorite untuk menghapus item favorit dari daftar
                context.read<AppState>().removeFavorite(pair);
              },
            ),
          ),
      ],
    );
  }
}
