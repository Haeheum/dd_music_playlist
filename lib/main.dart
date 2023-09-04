import 'package:dd_music_playlist/src/item.dart';
import 'package:dd_music_playlist/src/item_tile.dart';
import 'package:dd_music_playlist/src/music_catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const apiKey = 'AIzaSyCBpA_Ij4urqGOptMIGGuHW0QG6VfkPmGY';
const playlistId = 'PLZBpWYucMEG9NG-YWc8VvroYLxuO0_dkd';
const kind = 'youtube#video';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MusicCatalog>(
      create: (context) => MusicCatalog(),
      child: MaterialApp(
        home: Scaffold(
          body: Selector<MusicCatalog, int?>(
            selector: (context, musicCatalog) => musicCatalog.itemCount,
            builder: (context, int? value, Widget? child) =>
                ListView.builder(
              itemBuilder: (context, index) {
                var musicCatalog = Provider.of<MusicCatalog>(context);

                return switch (musicCatalog.getByIndex(index)) {
                  Item(isLoading: true) => const LoadingItemTile(),
                  var item => ItemTile(item: item)
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}
