import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  final List<String> moviePosters = [
    'assets/pImg2.png',
    'assets/pImg3.png',
    'assets/pImg1.png',
    'assets/pImg4.png',
    'assets/film3.jpg',
    'assets/film4.jpg',
    'assets/film5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 9 / 3,
        viewportFraction: 0.3,
        enlargeStrategy: CenterPageEnlargeStrategy.height
      ),
      itemCount: moviePosters.length,
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
              image: AssetImage(moviePosters[itemIndex]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
