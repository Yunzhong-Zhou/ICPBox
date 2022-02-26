class InformationList {
  final List<InformationItem> list;

  InformationList(this.list);

  factory InformationList.fromJson(List<dynamic> list) {
    return InformationList(
      list.map((item) => InformationItem.fromJson(item)).toList(),
    );
  }
}

class InformationItem {
  final String id;
  final String title;
  final String cover;
  final String keywords;
  final String tag;
  final String digest;
  final String createdAt;

  InformationItem(
      {required this.id,
        required this.title,
        required this.cover,
        required this.keywords,
        required this.tag,
        required this.digest,
        required this.createdAt});

  factory InformationItem.fromJson(dynamic item) {
    return InformationItem(
        id: item["id"],
        title: item["title"],
        cover: item["cover"],
        keywords: item["keywords"],
        tag: item["tag"],
        digest: item["digest"],
        createdAt: item["createdAt"]);
  }
}