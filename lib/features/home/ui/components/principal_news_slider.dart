import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mobile_news/features/news/models/news.dart';

class PrincipalNewsSlider extends StatelessWidget {
  final List<News> popularNews;
  final bool isDarkTheme;

  const PrincipalNewsSlider(
      {super.key, required this.popularNews, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.25,
      child: Swiper(
        itemCount: 10, //popularNews.leght
        layout: SwiperLayout.DEFAULT,
        itemHeight: size.height * 0.3,
        autoplay: true,
        autoplayDelay: 10000,

        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 0,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage('https://placehold.co/600x400/png'),
                    placeholderColor: Colors.grey,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: isDarkTheme ? Colors.black54 : Colors.white54,
                    ),
                    child: Text(
                      'Exercitation velit culpa nulla cupidatat ea veniam laboris aliquip cupidatat nisi adipisicing sint. Commodo eu ex dolore nostrud reprehenderit commodo aute cupidatat fugiat ut proident veniam consequat sit. Consectetur proident occaecat consequat quis minim ipsum sit consequat id. Excepteur in pariatur aute sint exercitation cillum laborum mollit.',
                      style: textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
