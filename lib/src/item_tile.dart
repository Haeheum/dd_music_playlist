import 'package:dd_music_playlist/src/item.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: AspectRatio(
          aspectRatio: 1,
          child: Image.network(item.thumbnailUrl),
        ),
        title: Text(item.title, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}

class LoadingItemTile extends StatelessWidget {
  const LoadingItemTile({super.key});

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
