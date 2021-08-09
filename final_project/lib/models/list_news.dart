class ListNews {
  bool success;
  Null message;
  Data data;

  ListNews({this.success, this.message, this.data});

  ListNews.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String title;
  String description;
  String link;
  List<Posts> posts;

  Data({this.title, this.description, this.link, this.posts});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    link = json['link'];
    if (json['posts'] != null) {
      posts = new List<Posts>();
      json['posts'].forEach((v) {
        posts.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['link'] = this.link;
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String title;
  String description;
  String pubDate;
  String link;
  String thumbnail;
  Null content;

  Posts(
      {this.title,
      this.description,
      this.pubDate,
      this.link,
      this.thumbnail,
      this.content});

  Posts.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    pubDate = json['pubDate'];
    link = json['link'];
    thumbnail = json['thumbnail'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['pubDate'] = this.pubDate;
    data['link'] = this.link;
    data['thumbnail'] = this.thumbnail;
    data['content'] = this.content;
    return data;
  }
}