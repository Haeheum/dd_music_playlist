import 'package:dd_music_playlist/src/item_page.dart';

class PlaylistRepository {

  static final PlaylistRepository instance = PlaylistRepository._();
  PlaylistRepository._();
  factory PlaylistRepository() => instance;

  final Map<int, ItemPage> _pages = {};
  final Set<int> _pagesBeingFetched = {};

  Future<ItemPage> getPlaylistItems(String? pageToken){


    return ItemPage(items: List.generate(length, (index) => null), totalResults: totalResults)
  }
  Future<ItemPage> getPage(int page) async{
    if(_pages[page] == null)
    return _pages[page];
  }

}
