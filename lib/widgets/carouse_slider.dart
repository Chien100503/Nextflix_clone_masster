import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screem_CarouseSlider extends StatefulWidget {
  const screem_CarouseSlider({super.key});

  @override
  State<screem_CarouseSlider> createState() => _screem_CarouseSliderState();
}

class _screem_CarouseSliderState extends State<screem_CarouseSlider> {
  final List<String> imageList = [
    'assets/film1.png',
    'assets/film2.jpg',
    'assets/film3.jpg',
    'assets/film4.jpg',
    'assets/film5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        itemCount: imageList.length,
        options: CarouselOptions(
            enlargeCenterPage: true,
            height: 478,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 2),
            viewportFraction: 0.9,
            autoPlayCurve: Curves.fastEaseInToSlowEaseOut),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imageList[itemIndex]),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                  image: AssetImage((itemIndex == 0)
                      ? 'assets/tFilm1.png'
                      : (itemIndex == 1)
                          ? 'assets/tFilm1.png'
                          : 'assets/tFilm1.png'),
                  height: 50,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Udda • Fyndig • Mörk komedi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              size: 20,
                            ),
                            Text(
                              'Play',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.plus,
                              size: 20,
                              color: Colors.white,
                            ),
                            Text(
                              'My list',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
