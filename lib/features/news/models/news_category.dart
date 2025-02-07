import 'dart:convert';

NewsCategory newsCategoryFromJson(String str) =>
    NewsCategory.fromJson(json.decode(str));

class NewsCategory {
  final String categoryName;
  final String categoryDescription;
  final String image;

  NewsCategory({
    required this.categoryName,
    required this.categoryDescription,
    required this.image,
  });

  factory NewsCategory.fromJson(Map<String, dynamic> json) => NewsCategory(
        categoryName: json['categoryName'],
        categoryDescription: json['categoryDescription'],
        image: json['image'],
      );
}
