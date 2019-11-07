import 'package:fh2019/core/models/category.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:fh2019/core/viewmodel/category_viewmodel.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:fh2019/ui/widgets/CarouselBanner.dart';
import 'package:fh2019/ui/widgets/IncrementalButton.dart';
import 'package:fh2019/ui/widgets/category_button.dart';
import 'package:fh2019/ui/widgets/footer_button.dart';
import 'package:fh2019/ui/widgets/item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  CheckOut({Key key}) : super(key: key);
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut>
    with AutomaticKeepAliveClientMixin<CheckOut> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (mounted) {}
  }

  @override
  Widget build(BuildContext context) {
    final CategoryViewModel categoryViewModel =
        Provider.of<CategoryViewModel>(context);

    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);

    return Scaffold(
        body: Column(
          children: <Widget>[
            new CarouselBanner(),
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      child: Container(
                        width: CustomMedia.screenWidth,
                        height: CustomMedia.screenHeight * .13,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  height: CustomMedia.screenHeight * .15,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(50),
                                    ),
                                    child: Image.asset(
                                      "assets/images/items/vegetables/beef_stir_fry.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  width: CustomMedia.screenWidth * .20,
                                  height: 50,
                                  child: Image.asset(
                                    "assets/images/items/vegetables/beef_stir_fry.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  color: Colors.pink,
                                  width: CustomMedia.screenWidth * .70,
                                  height: 50,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Text(
                                            'Pinakbet',
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2,
                                          ),
                                          Text(
                                            'Vegetables',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                          Text(
                                            '25.00',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subhead,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Text(
                                            '200.00',
                                            style: Theme.of(context)
                                                .textTheme
                                                .title,
                                          ),
                                          Text(
                                            'Total',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IncrementalButton()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: CustomMedia.screenHeight * .10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Summary',
                              style: Theme.of(context).textTheme.caption),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('4 Items',
                                  style: Theme.of(context).textTheme.subhead),
                              Text('Total 533.53',
                                  style: Theme.of(context).textTheme.subhead)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: new FooterButton(
                      title: "Cancel",
                      color: CustomColors.red,
                      func: calcelCheckOut,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: new FooterButton(
                      color: CustomColors.blue,
                      title: "Proceed to Checkout",
                      func: () => proceedCheckOut(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  calcelCheckOut() {
    Navigator.of(context).pop();
  }

  proceedCheckOut() {
    Navigator.of(context).pop();
  }
}
