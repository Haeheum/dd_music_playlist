import 'package:dd_music_playlist/src/model/item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'model/item_page.dart';

class PlaylistCatalog extends ChangeNotifier {
  static const maxCacheDistance = 100;

  final Map<int, ItemPage> _pages = {};
  final Set<int> _pagesBeingFetched = {};

  int? itemCount;
  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Item getByIndex(int index) {
    var startingIndex = (index ~/ itemsPerPage) * itemsPerPage;

    if (_pages.containsKey(startingIndex)) {
      var item = _pages[startingIndex]!.items[index - startingIndex];
      return item;
    }

    _fetchPage(startingIndex);

    return Item.loading();
  }

  Future<void> _fetchPage(int startingIndex) async {
    if (_pagesBeingFetched.contains(startingIndex)) {
      return;
    }

    _pagesBeingFetched.add(startingIndex);
    final page = await fetchPage(startingIndex);
    _pagesBeingFetched.remove(startingIndex);

    if (!page.hasNext) {
      // The returned page has no next page. This means we now know the size
      // of the catalog.
      itemCount = startingIndex + page.items.length;
    }

    // Store the new page.
    _pages[startingIndex] = page;
    _pruneCache(startingIndex);

    if (!_isDisposed) {
      notifyListeners();
    }
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