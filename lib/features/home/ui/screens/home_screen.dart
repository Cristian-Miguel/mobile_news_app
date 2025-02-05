import 'package:flutter/material.dart';
import 'package:mobile_news/features/home/ui/components/news_type_slider.dart';
import 'package:mobile_news/features/home/ui/components/principal_news_slider.dart';
import 'package:mobile_news/features/news/models/news.dart';

//StatelessWidget
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Veritas')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrincipalNewsSlider(popularNews: []),
            Text('Home screen'),
            NewsTypeSlider(
              sectionNews: News(
                title: 'title',
                author: 'author',
                newsEnterprice: 'newsEnterprice',
                date: DateTime.timestamp(),
                content: List.empty(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
