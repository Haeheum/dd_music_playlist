import 'item.dart';

const int itemsPerPage = 25;

class ItemPage {
  final List<Item> items;
  int? totalResults;
  String? nextPageToken;

  bool get hasNext => nextPageToken != null;

  ItemPage.fromJson(Map<String, dynamic> json)
      : items = (json['items'] as List<dynamic>)
            .map((itemJson) => Item.fromJson(itemJson as Map<String, dynamic>))
            .toList(),
        totalResults = json['pageInfo']['totalResults'],
        nextPageToken = json['nextPageToken'];
}
