class NoticeModel {
  List<NoticeItem>? list;

  NoticeModel({this.list});

  NoticeModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <NoticeItem>[];
      json['list'].forEach((v) {
        list!.add(new NoticeItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NoticeItem {
  String? id;
  String? title;
  String? createdAt;

  NoticeItem({this.id, this.title, this.createdAt});

  NoticeItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['createdAt'] = this.createdAt;
    return data;
  }
}