import '../constants.dart';
import '../model/item_page.dart';
import '../network/http.dart';

Future<ItemPage> getPlaylistItemPage(String? pageToken) async {
  var queryParameters = GetRequestQuery(pageToken: pageToken).toJson();
  var response =
      await dio.get('/playlistItems', queryParameters: queryParameters);

  return ItemPage.fromJson(response.data);
}

class GetRequestQuery {
  final List<String> part = ["snippet"];
  String? pageToken;

  GetRequestQuery({this.pageToken});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['part'] = part;
    data['maxResults'] = maxResults;
    data['pageToken'] = pageToken;
    data['playlistId'] = playlistId;
    return data;
  }
}

Future<ItemPage> insertPlaylistItem(String? pageToken) async {
  var queryParameters = GetRequestQuery(pageToken: pageToken).toJson();
  var response =
  await dio.get('/playlistItems', queryParameters: queryParameters);

  return ItemPage.fromJson(response.data);
}

Future<ItemPage> updatePlaylistItem(String? pageToken) async {
  var queryParameters = GetRequestQuery(pageToken: pageToken).toJson();
  var response =
  await dio.get('/playlistItems', queryParameters: queryParameters);

  return ItemPage.fromJson(response.data);
}

Future<bool> deletePlaylistItem(String id) async {
  final Map<String, dynamic> queryParameters = <String, dynamic>{};
  queryParameters['id'] = id;
  var response = await dio.delete('/playlistItems', queryParameters: queryParameters);
  return response.statusCode == 204;
}