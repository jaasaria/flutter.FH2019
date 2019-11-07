import 'package:carousel_slider/carousel_slider.dart';
import 'package:fh2019/core/shared/custom_assets.dart';
import 'package:flutter/material.dart';

class CarouselBanner extends StatelessWidget {
  const CarouselBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: 130,
      // aspectRatio: 16 / 9,
      aspectRatio: MediaQuery.of(context).size.aspectRatio,
      viewportFraction: 1.0,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 10),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: false,
      scrollDirection: Axis.horizontal,
      items: CustomAssets.banner.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                i,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
