import 'package:dd_music_playlist/src/item.dart';
import 'package:flutter/material.dart';

class ItemGridTile extends StatelessWidget {
  final Item item;

  const ItemGridTile({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: const Color(0x66000000),
          title: Text(item.title, style: Theme.of(context).textTheme.titleLarge),
        ),
        child: Image.network(item.thumbnailUrl),
      ),
    );
  }
}

class LoadingItemGridTile extends StatelessWidget {
  const LoadingItemGridTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const AspectRatio(
          aspectRatio: 1,
          child: Placeholder(),
        ),
        title: Text('...', style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
