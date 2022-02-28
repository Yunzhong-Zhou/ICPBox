class InformationDetailModel {
  Article? article;
  List<Recommend>? recommend;

  InformationDetailModel({this.article, this.recommend});

  InformationDetailModel.fromJson(Map<String, dynamic> json) {
    article =
    json['article'] != null ? new Article.fromJson(json['article']) : null;
    if (json['recommend'] != null) {
      recommend = <Recommend>[];
      json['recommend'].forEach((v) {
        recommend!.add(new Recommend.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.article != null) {
      data['article'] = this.article!.toJson();
    }
    if (this.recommend != null) {
      data['recommend'] = this.recommend!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Article {
  String? id;
  String? title;
  String? keywords;
  String? content;
  String? tag;
  String? digest;
  String? cover;
  String? createdAt;

  Article(
      {this.id,
        this.title,
        this.keywords,
        this.content,
        this.tag,
        this.digest,
        this.cover,
        this.createdAt});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    keywords = json['keywords'];
    content = json['content'];
    tag = json['tag'];
    digest = json['digest'];
    cover = json['cover'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['keywords'] = this.keywords;
    data['content'] = this.content;
    data['tag'] = this.tag;
    data['digest'] = this.digest;
    data['cover'] = this.cover;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Recommend {
  String? id;
  String? title;
  String? keywords;
  String? cover;
  String? createdAt;

  Recommend({this.id, this.title, this.keywords, this.cover, this.createdAt});

  Recommend.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    keywords = json['keywords'];
    cover = json['cover'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['keywords'] = this.keywords;
    data['cover'] = this.cover;
    data['createdAt'] = this.createdAt;
    return data;
  }
}