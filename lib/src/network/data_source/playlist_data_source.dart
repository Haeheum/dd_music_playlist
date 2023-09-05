import 'dart:math';

import '../../item.dart';
import '../../item_page.dart';
import '../http.dart';

Future<ItemPage> getPlaylistItems(String? pageToken) async {
  var response = await dio.get('/playlistItems');

  return ItemPage(
    items: List.generate(
      min(itemsPerPage, catalogLength - startingIndex),
          (index) =>
          Item(
              title: "asd",
              thumbnailUrl:
          ),),
    totalResults:
  );
}

class PlaylistResponse{


}