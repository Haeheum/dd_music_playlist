import 'package:flutter/material.dart';

class Item {
  final String title;
  final String thumbnailUrl;

  Item({
    required this.title,
    required this.thumbnailUrl,
  });

  Item.loading() : this(title: '...', thumbnailUrl: 'https://ichef.bbci.co.uk/news/976/cpsprodpb/16620/production/_91408619_55df76d5-2245-41c1-8031-07a4da3f313f.jpg.webp');

  bool get isLoading => title == '...';
}