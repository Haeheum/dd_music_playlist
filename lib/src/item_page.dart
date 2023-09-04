import 'item.dart';

const int itemsPerPage = 25;

class ItemPage {
  final List<Item> items;
  final int startingIndex;
  final int totalResults;
  String? nextPageToken;
  String? prevPageToken;


  ItemPage({
    required this.items,
    required this.startingIndex,
  });
}
