class NewsItem {
  final String title;
  final DateTime publish_date;
  final String? url;
  final String text;
  final String image;

  NewsItem({
    required this.title,
    required this.publish_date,
    this.url,
    required this.text,
    required this.image,
  });
}
