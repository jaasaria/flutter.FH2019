import 'package:fh2019/core/models/category.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String img;
  final String title;
  final List<Category> category;
  final String price;

  ItemCard({
    Key key,
    @required this.img,
    @required this.title,
    @required this.category,
    @required this.price,
  }) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width / 2 ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                height: CustomMedia.screenHeight * .15,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    "${widget.img}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: -10.0,
                  //   right: -10.0,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: CustomColors.lightblue,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Text(
                      " ${widget.price} ",
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(color: Colors.white),
                    ),
                  )),
              //   Positioned.fill(
              //     child: Align(
              //       alignment: Alignment.bottomRight,
              //       child: Row(
              //         children: widget.category.map((index) {
              //           return Padding(
              //               padding: const EdgeInsets.only(right: 5),
              //               child: Container(
              //                 padding: EdgeInsets.symmetric(horizontal: 10),
              //                 decoration: BoxDecoration(
              //                     color: Color.fromRGBO(38, 38, 38, 0.6),
              //                     borderRadius: BorderRadius.circular(50.0)),
              //                 child: Text(
              //                   "${index.name}",
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .caption
              //                       .copyWith(color: Colors.white70),
              //                   overflow: TextOverflow.ellipsis,
              //                 ),
              //               ));
              //         }).toList(),
              //       ),
              //     ),
              //   ),
              Positioned(
                bottom: 5.0,
                // left: 10.0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: widget.category.map((index) {
                      return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(38, 38, 38, 0.6),
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Text(
                              "${index.name}",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Colors.white70),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ));
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Text(
                      "${widget.title}",
                      style: Theme.of(context).textTheme.body2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),

                  //   Expanded(
                  //     child: Text(
                  //       "${widget.title}",
                  //       style: Theme.of(context).textTheme.body2,
                  //       textAlign: TextAlign.center,
                  //       overflow: TextOverflow.ellipsis,
                  //       maxLines: 2,
                  //     ),
                  //   ),
                  //   Expanded(
                  //       flex: 1,
                  //       child: Row(
                  //         children: widget.category.map((index) {
                  //           return Padding(
                  //               padding: const EdgeInsets.only(right: 5),
                  //               child: Container(
                  //                 padding:
                  //                     EdgeInsets.symmetric(horizontal: 10),
                  //                 decoration: BoxDecoration(
                  //                     color: Colors.grey[400],
                  //                     borderRadius:
                  //                         BorderRadius.circular(50.0)),
                  //                 child: Text(
                  //                   "${index.name}",
                  //                   style: Theme.of(context)
                  //                       .textTheme
                  //                       .caption
                  //                       .copyWith(color: Colors.white),
                  //                   overflow: TextOverflow.ellipsis,
                  //                 ),
                  //               ));
                  //         }).toList(),
                  //       )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
