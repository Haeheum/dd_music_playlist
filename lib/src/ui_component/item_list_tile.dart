import 'package:dd_music_playlist/src/model/item.dart';
import 'package:flutter/material.dart';

class ItemListTile extends StatelessWidget {
  final Item item;

  const ItemListTile({required this.item, super.key});

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

class LoadingItemListTile extends StatelessWidget {
  const LoadingItemListTile({super.key});

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
