class InformationList {
  List<InformationItem>? list;

  InformationList({this.list});

  InformationList.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <InformationItem>[];
      json['list'].forEach((v) {
        list!.add(InformationItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InformationItem {
  String? id;
  String? title;
  String? cover;
  String? keywords;
  String? tag;
  String? digest;
  String? createdAt;

  InformationItem(
      {this.id,
        this.title,
        this.cover,
        this.keywords,
        this.tag,
        this.digest,
        this.createdAt});

  InformationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    cover = json['cover'];
    keywords = json['keywords'];
    tag = json['tag'];
    digest = json['digest'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['cover'] = cover;
    data['keywords'] = keywords;
    data['tag'] = tag;
    data['digest'] = digest;
    data['createdAt'] = createdAt;
    return data;
  }
}