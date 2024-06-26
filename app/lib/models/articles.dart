class Articles {
  final String id;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  Articles({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      id: json['_id'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }
}

class ArticlesResponse {
  final List<Articles> data;

  ArticlesResponse({required this.data});

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Articles> articlesList =
        list.map((i) => Articles.fromJson(i)).toList();

    return ArticlesResponse(data: articlesList);
  }
}
