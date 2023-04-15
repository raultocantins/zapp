class NewsItem {
  final String title;
  final String? author;
  final DateTime published_date;
  final String? link;
  final String? clean_url;
  final String excerpt;
  final String summary;
  final String? rights;
  final String media;

  NewsItem({
    required this.title,
    this.author,
    required this.published_date,
    this.link,
    this.clean_url,
    required this.excerpt,
    required this.summary,
    this.rights,
    required this.media,
  });
}
