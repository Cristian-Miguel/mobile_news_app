import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mobile_news/features/news/models/news.dart';

class PrincipalNewsSlider extends StatelessWidget {
  final List<News> popularNews;

  const PrincipalNewsSlider({super.key, required this.popularNews});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.35,
      child: Swiper(
        itemCount: 10, //popularNews.leght
        layout: SwiperLayout.DEFAULT,
        // itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.3,
        itemBuilder: (_, int index) {
          // final news = popularNews[index];
          return GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 47,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage('https://placehold.co/600x400/png'),
                    placeholderColor: Colors.grey,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 47,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      // borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Exercitation velit culpa nulla cupidatat ea veniam laboris aliquip cupidatat nisi adipisicing sint. Commodo eu ex dolore nostrud reprehenderit commodo aute cupidatat fugiat ut proident veniam consequat sit. Consectetur proident occaecat consequat quis minim ipsum sit consequat id. Excepteur in pariatur aute sint exercitation cillum laborum mollit.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
