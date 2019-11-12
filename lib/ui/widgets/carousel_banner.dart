import 'package:animator/animator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fh2019/core/shared/custom_assets.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:flutter/material.dart';

class CarouselBanner extends StatelessWidget {
  const CarouselBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animator(
      tweenMap: {
        "opacity": Tween<double>(begin: 0, end: 1),
        "scale": Tween<double>(begin: 0, end: 1),
        "translation": Tween<Offset>(begin: Offset(0, .5), end: Offset.zero),
      },
      duration: Duration(milliseconds: 3000),
      curve: Interval(0, .6, curve: Curves.fastLinearToSlowEaseIn),
      builderMap: (Map<String, Animation> anim) => FadeTransition(
        opacity: anim["opacity"],
        child: FractionalTranslation(
          translation: anim["translation"].value,
          child: ScaleTransition(
              scale: anim["scale"],
              child: CarouselSlider(
                height: CustomMedia.screenHeight * .16,
                // aspectRatio: 16 / 9,
                aspectRatio: MediaQuery.of(context).size.aspectRatio,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 7),
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
              )),
        ),
      ),
    );
  }
}
