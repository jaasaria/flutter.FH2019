import 'package:fh2019/core/shared/custom_assets.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<String> banner = [
  "assets/images/banner/banner1.png",
  "assets/images/banner/banner2.png",
  "assets/images/banner/banner3.png",
  "assets/images/banner/banner4.png",
  "assets/images/banner/banner5.png"
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

final List child = map<Widget>(
  banner,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                border: Border.all()),
            padding: EdgeInsets.all(10),
            child: Text('Vegetables'),
          ),
          OutlineButton(
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {},
            borderSide: BorderSide(color: Colors.grey),
            child: Container(
              color: Colors.pink,
              child: Text('Test me here'),
            ),
          ),
          OutlineButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            color: Colors.red[200],
            borderSide: BorderSide(color: Colors.grey, width: 2),
            onPressed: () {},
            child: Text(
              'View Bill',
              style: TextStyle(color: CustomColors.primaryColorLight),
            ),
          ),
          FlatButton(
              shape: new RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey, width: 1),
                  borderRadius: new BorderRadius.circular(20.0)),
              onPressed: () {},
              color: Colors.grey[200],
              child: Text('Vegetables')),
          CarouselSlider(
            height: 100,
            // aspectRatio: 16 / 9,
            aspectRatio: MediaQuery.of(context).size.aspectRatio,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 10),
            autoPlayAnimationDuration: Duration(milliseconds: 5000),
            pauseAutoPlayOnTouch: Duration(seconds: 10),
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
            items: CustomAssets.banner.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Image.asset(
                      i,
                      fit: BoxFit.cover,
                      width: 1000.0,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
