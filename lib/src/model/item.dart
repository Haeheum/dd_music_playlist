class Item {
  final String id;
  final String title;
  final String thumbnailUrl;

  Item({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });

  Item.loading()
      : this(
            id: '...',
            title: '...',
            thumbnailUrl:
                'https://ichef.bbci.co.uk/news/976/cpsprodpb/16620/production/_91408619_55df76d5-2245-41c1-8031-07a4da3f313f.jpg.webp');

  bool get isLoading => id == '...';

  Item.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['snippet']['title'],
        thumbnailUrl = json['snippet']['thumbnails']['default']['url'];
}
