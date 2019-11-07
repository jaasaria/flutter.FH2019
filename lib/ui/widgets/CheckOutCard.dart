import 'package:fh2019/core/shared/custom_media.dart';
import 'package:flutter/material.dart';

import 'IncrementalButton.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3, left: 8, right: 8),
      child: Card(
        elevation: 3,
        child: Container(
          width: CustomMedia.screenWidth,
          height: CustomMedia.screenHeight * .15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: CustomMedia.screenWidth * .20,
                      height: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/items/vegetables/beef_stir_fry.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: CustomMedia.screenWidth * .65,
                      height: 70,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                'Pinakbet',
                                style: Theme.of(context).textTheme.body2,
                              ),
                              Text(
                                'Vegetables',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                '25.00',
                                style: Theme.of(context).textTheme.subhead,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                '200.00',
                                style: Theme.of(context).textTheme.title,
                              ),
                              Text(
                                'Total',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                child: Stack(
                  children: <Widget>[
                    IncrementalButton(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: 50,
                        child: FlatButton(
                          padding: EdgeInsets.all(0),
                          shape: new ContinuousRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          onPressed: () {},
                          color: Colors.grey[500],
                          child: IconButton(
                            padding: EdgeInsets.only(bottom: 2),
                            color: Colors.white,
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
