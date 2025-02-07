import 'package:flutter/material.dart';
import 'package:mobile_news/features/news/models/news.dart';

class NewsTypeSlider extends StatelessWidget {
  final News sectionNews;
  final String typeNews;

  const NewsTypeSlider(
      {super.key, required this.sectionNews, required this.typeNews});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Column(
      children: [_BasicComponentNewsSection()],
    );
  }
}

class _BasicComponentNewsSection extends StatelessWidget {
  final News? news;
  const _BasicComponentNewsSection({super.key, this.news});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: FadeInImage(
                width: size.width * 0.4,
                height: 150,
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://placehold.co/600x400/png'),
                placeholderColor: const Color.fromARGB(255, 248, 223, 223),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: size.width * 0.4,
              child: Text(
                'Ullamco occaecat laboris eiusmod pariatur tempor magna sit sint labore nostrud exercitation commodo nostrud labore. Ex nisi enim occaecat occaecat irure occaecat sint dolor cupidatat irure irure nisi. Proident in consequat ipsum magna minim enim anim ex velit. Nostrud do laborum ut ut magna eiusmod id nisi. Sit sunt quis deserunt dolor ipsum adipisicing ullamco sunt ad proident eu est. Enim aliquip laborum do aliquip consequat mollit enim.',
                style: textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 9,
              ),
            )
          ],
        )
      ],
    );
  }
}
