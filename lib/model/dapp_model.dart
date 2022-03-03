class DappModel {
  List<Hot>? hot;
  List<Hot>? news;
  List<MyType>? type;

  DappModel({this.hot, this.news, this.type});

DappModel.fromJson(Map<String, dynamic> json) {
if (json['hot'] != null) {
hot = <Hot>[];
json['hot'].forEach((v) { hot!.add(new Hot.fromJson(v)); });
}
if (json['new'] != null) {
news = <Hot>[];
json['new'].forEach((v) { news!.add(new Hot.fromJson(v)); });
}
if (json['type'] != null) {
type = <MyType>[];
json['type'].forEach((v) { type!.add(new MyType.fromJson(v)); });
}
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (this.hot != null) {
    data['hot'] = this.hot!.map((v) => v.toJson()).toList();
  }
  if (this.news != null) {
    data['new'] = this.news!.map((v) => v.toJson()).toList();
  }
  if (this.type != null) {
    data['type'] = this.type!.map((v) => v.toJson()).toList();
  }
  return data;
}
}

class Hot {
  String? id;
  String? link;
  String? name;
  String? dappSlogan;
  String? img;

  Hot({this.id, this.link, this.name, this.dappSlogan, this.img});

  Hot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    name = json['name'];
    dappSlogan = json['dapp_slogan'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['name'] = this.name;
    data['dapp_slogan'] = this.dappSlogan;
    data['img'] = this.img;
    return data;
  }
}

class MyType {
  String? id;
  String? title;

  MyType({this.id, this.title});

  MyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}