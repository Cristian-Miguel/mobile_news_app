import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_news/app.dart';
import 'package:mobile_news/features/home/ui/components/news_category_slider.dart';
import 'package:mobile_news/features/home/ui/components/news_type_slider.dart';
import 'package:mobile_news/features/home/ui/components/principal_news_slider.dart';
import 'package:mobile_news/features/news/models/news.dart';

//StatelessWidget
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  bool _isDarkTheme(WidgetRef ref) {
    return ref.watch(darkModeProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Veritas')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrincipalNewsSlider(
              popularNews: [],
              isDarkTheme: _isDarkTheme(ref),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'Categories',
                style: textTheme.titleLarge,
              ),
            ),
            NewsCategorySlider(
              newsCategories: List.empty(),
              isDarkTheme: _isDarkTheme(ref),
            ),
            NewsTypeSlider(
              sectionNews: News(
                title: 'title',
                author: 'author',
                newsEnterprice: 'newsEnterprice',
                date: DateTime.timestamp(),
                content: List.empty(),
              ),
              typeNews: 'Sports',
            ),
          ],
        ),
      ),
    );
  }
}
