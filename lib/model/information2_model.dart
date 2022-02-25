import 'package:flutter/cupertino.dart';

class Information2List {
  final List<Information2Item> list;

  Information2List(this.list);

  factory Information2List.formJson(List<Information2Item> list) {
    return Information2List(
      list.map((item) => Information2Item.fromJson(item)).toList(),
    );
  }
}

class Information2Item {
  final String id;
  final String title;
  final String cover;
  final String keywords;
  final String tag;
  final String digest;
  final String createdAt;

  Information2Item(
      {required this.id,
      required this.title,
      required this.cover,
      required this.keywords,
      required this.tag,
      required this.digest,
      required this.createdAt});

  factory Information2Item.fromJson(dynamic item) {
    return Information2Item(
        id: item["id"],
        title: item["title"],
        cover: item["cover"],
        keywords: item["keywords"],
        tag: item["tag"],
        digest: item["digest"],
        createdAt: item["createdAt"]);
  }
}
