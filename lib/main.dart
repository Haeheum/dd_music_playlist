import 'package:dd_music_playlist/src/model/item.dart';
import 'package:dd_music_playlist/src/repository/playlist_repository.dart';
import 'package:dd_music_playlist/src/ui_component/item_list_tile.dart';
import 'package:dd_music_playlist/src/playlist_catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlaylistRepository>(
      create: (context) => PlaylistRepository(),
      child: MaterialApp(
        home: Scaffold(
          body: Selector<PlaylistRepository, int?>(
            selector: (context, musicCatalog) => musicCatalog.itemCount,
            builder: (context, int? value, Widget? child) =>
                ListView.builder(
              itemBuilder: (context, index) {
                var playlistRepository = Provider.of<PlaylistRepository>(context);

                return switch (PlaylistRepository.getByIndex(index)) {
                  Item(isLoading: true) => const LoadingItemListTile(),
                  var item => ItemListTile(item: item)
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}
