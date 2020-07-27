import '../utils.dart';

class Gallery {
  int id;
  String title;
  String publishDate;
  String description;
  String thumbnail;

  Gallery([
    this.title,
    this.publishDate,
    this.description,
    this.thumbnail,
  ]);

  Gallery.fromJson(Map json) {
    id = json['id'];
    title = json['title'];
    publishDate = formatPublishedDate(json['publishDate']);
    description = json['description'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'publishDate': publishDate,
      'description': description,
      'thumbnail': thumbnail,
    };
  }
}
