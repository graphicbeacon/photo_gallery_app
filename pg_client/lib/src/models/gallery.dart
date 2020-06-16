import '../utils.dart';

class Gallery {
  int id;
  String title;
  String publishDate;
  String description;
  String thumbnailUrl;

  Gallery([
    this.title,
    this.publishDate,
    this.description,
    this.thumbnailUrl,
  ]);

  Gallery.fromJson(Map json) {
    id = json['id'];
    title = json['title'];
    publishDate = formatPublishedDate(json['publishDate']);
    description = json['description'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'publishDate': publishDate,
      'description': description,
    };
  }
}
