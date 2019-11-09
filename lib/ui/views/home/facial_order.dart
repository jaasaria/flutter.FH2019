import 'package:fh2019/core/config/routes.dart';
import 'package:fh2019/core/models/category.dart';
import 'package:fh2019/core/models/item.dart';
import 'package:fh2019/core/shared/custom_colors.dart';
import 'package:fh2019/core/shared/custom_media.dart';
import 'package:fh2019/core/viewmodel/category_viewmodel.dart';
import 'package:fh2019/core/viewmodel/item_viewmodel.dart';
import 'package:fh2019/ui/widgets/carousel_banner.dart';
import 'package:fh2019/ui/widgets/checkout_card.dart';
import 'package:fh2019/ui/widgets/facial_item_card.dart';
import 'package:fh2019/ui/widgets/footer_button.dart';
import 'package:fh2019/ui/widgets/footer_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:progress_dialog/progress_dialog.dart';

class FacialOrder extends StatefulWidget {
  Emotion emotion;

  FacialOrder({this.emotion, Key key}) : super(key: key);
  _FacialOrderState createState() => _FacialOrderState();
}

class _FacialOrderState extends State<FacialOrder>
    with AutomaticKeepAliveClientMixin<FacialOrder> {
  @override
  bool get wantKeepAlive => true;

  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      // getCheckOutItems
    }
  }

  @override
  Widget build(BuildContext context) {
    final ItemViewModel itemViewModel = Provider.of<ItemViewModel>(context);
    pr = new ProgressDialog(context);

    final FacialOrder args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: Column(
          children: <Widget>[
            new CarouselBanner(),
            Expanded(
              child: ListView.builder(
                itemCount: itemViewModel.getCheckOutItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return FacialItemCard(
                    item: itemViewModel.getCheckOutItems[index],
                  );
                },
              ),
            )
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
                              Text(
                                  'Facial Expression: ${args.emotion.toString().split('.').last}',
                                  style: Theme.of(context).textTheme.subhead),
                              Text(
                                  'Total ${itemViewModel.getCheckOutItemsTotalAmount}',
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
                      title: "Next",
                      func: itemViewModel.getCheckOutItems.length >= 1
                          ? () => proceedCheckOut()
                          : null,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  calcelCheckOut() {
    Navigator.of(context).pop();
  }

  proceedCheckOut() async {
    Navigator.of(context).pushReplacementNamed(Routes.checkout);
  }
}
