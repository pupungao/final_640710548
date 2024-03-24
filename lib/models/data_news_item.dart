class DataNews {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final bool selected;

  DataNews({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.selected = false,
  });

  factory DataNews.fromJson(Map<String, dynamic> json) {
    return DataNews(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      imageUrl: json['image'],
    );
  }
}