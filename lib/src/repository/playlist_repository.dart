import 'package:flutter/material.dart';

import '../model/item_page.dart';

class PlaylistRepository extends ChangeNotifier {
  static const maxCacheDistance = 100;

  final Map<int, ItemPage> _pages = {};
  final Set<int> _pagesBeingFetched = {};

  int? itemCount;
  bool _isDisposed = false;

  Future<ItemPage> getPlaylistItems(String? pageToken) {
    return ItemPage(items: List.generate(length, (index) => null),
        totalResults: totalResults)
  }

  Future<ItemPage> getPage(int page) async {
    if (_pages[page] == null)
      return _pages[page];
  }


  void _pruneCache(int currentStartingIndex) {
    final keysToRemove = <int>{};
    for (final key in _pages.keys) {
      if ((key - currentStartingIndex).abs() > maxCacheDistance) {
        keysToRemove.add(key);
      }
    }
    for (final key in keysToRemove) {
      _pages.remove(key);
    }
  }
}
