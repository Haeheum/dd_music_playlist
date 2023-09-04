import 'dart:math';
import 'package:flutter/material.dart';

import 'item.dart';
import 'item_page.dart';

Future<ItemPage> fetchPage(int startingIndex) async {
  //todo: network call
  await Future<void>.delayed(const Duration(milliseconds: 500));

  return ItemPage(
    items: List.generate(
        min(itemsPerPage, catalogLength - startingIndex),
            (index) =>
            Item(
                title: "asd",
                thumbnailUrl:
            ),),
    startingIndex: startingIndex,
  );
}