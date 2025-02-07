import 'package:flutter/material.dart';
import 'package:mobile_news/features/news/models/news_category.dart';

class NewsCategorySlider extends StatefulWidget {
  final List<NewsCategory> newsCategories;
  final bool isDarkTheme;

  const NewsCategorySlider(
      {super.key, required this.newsCategories, required this.isDarkTheme});

  @override
  State<NewsCategorySlider> createState() => _NewsCategorySliderState();
}

class _NewsCategorySliderState extends State<NewsCategorySlider> {
  final ScrollController scrollController = new ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, int index) => _CardCategoryNews(
          isDarkTheme: widget.isDarkTheme,
        ),
      ),
    );
  }
}

class _CardCategoryNews extends StatelessWidget {
  final NewsCategory? newsCategory;
  final bool isDarkTheme;

  const _CardCategoryNews(
      {super.key, this.newsCategory, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: 120,
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('https://placehold.co/600x400/png'),
                  placeholderColor: Colors.grey,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: isDarkTheme ? Colors.black54 : Colors.white54,
                  ),
                  child: Center(
                    child: Text(
                      'Exercitation velit culpa.',
                      style: textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
