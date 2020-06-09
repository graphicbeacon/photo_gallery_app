class Gallery {
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
    title = json['title'];
    publishDate = json['publishDate'];
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
