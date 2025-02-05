import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

class News {
  final String title;
  final String? subtitle;
  final String? mainImage;
  final String author;
  final String newsEnterprice;
  final DateTime date;
  final List<Object> content;

  News({
    required this.title,
    this.mainImage,
    this.subtitle,
    required this.author,
    required this.newsEnterprice,
    required this.date,
    required this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        title: json['title'],
        subtitle: json['subtitle'] ?? '',
        author: json['author'],
        newsEnterprice: json['newsEnterprice'],
        date: json['date'],
        content: List.from(json['content'].map((x) => x)),
      );
}
